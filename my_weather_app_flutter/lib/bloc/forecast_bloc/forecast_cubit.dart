import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:my_weather_app_flutter/bloc/forecast_bloc/forecast_state.dart';
import 'package:my_weather_app_flutter/model/enums/lang.dart';
import 'package:my_weather_app_flutter/model/enums/mode.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';
import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_request.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit(
      {required LocationData locationData,
      required OpenWeatherMapApi openWeatherMapApi})
      : _locationData = locationData,
        _openWeatherMapApi = openWeatherMapApi,
        super(RequestingForecastDataState());

  final LocationData _locationData;
  final OpenWeatherMapApi _openWeatherMapApi;

  Future<void> requestForecastData() async {
    switch (state) {
      case RequestingForecastDataState _:
        {
          return _requestForecastData();
        }
      default:
        {
          return emitFailureState(InvalidStateFailure());
        }
    }
  }

  Future<void> emitFailureState(Failure failure) async {
    return emit(
      ShowingFailureState(failure: failure),
    );
  }

  Future<void> _requestForecastData() async {
    final request = GetForecastRequest(
      lat: _locationData.latitude ?? 0,
      lon: _locationData.longitude ?? 0,
      appid: Constants.appid,
      units: Units.metric,
      mode: Mode.json,
      cnt: 24,
      lang: Lang.english,
    );

    final result = await _openWeatherMapApi.getForecast(request);

    if (result.$1 != null) {
      return emitFailureState(OpenWeatherMapApiFailure(message: result.$1!));
    } else {
      return result.$2 != null
          ? emit(ShowingForecastState(forecastData: result.$2!))
          : emitFailureState(
              DefaultFailure(),
            );
    }
  }
}
