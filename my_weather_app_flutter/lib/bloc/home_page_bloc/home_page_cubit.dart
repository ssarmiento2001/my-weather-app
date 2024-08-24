import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:my_weather_app_flutter/bloc/home_page_bloc/home_page_state.dart';
import 'package:my_weather_app_flutter/model/enums/lang.dart';
import 'package:my_weather_app_flutter/model/enums/mode.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_request.dart';
import 'package:my_weather_app_flutter/services/location_service.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
      {required LocationService locationService,
      required OpenWeatherMapApi openWeatherMapApi})
      : _locationService = locationService,
        _openWeatherMapApi = openWeatherMapApi,
        super(InitializingState());

  final LocationService _locationService;
  final OpenWeatherMapApi _openWeatherMapApi;

  Future<void> initialize() async {
    switch (state) {
      case InitializingState _:
        {
          return _initialize();
        }
      default:
        {
          return emitFailureState(InvalidStateFailure());
        }
    }
  }

  Future<void> _initialize() async {
    final serviceEnabled = await _locationService.serviceEnabled();
    final serviceRequestResult =
        serviceEnabled ? true : await _locationService.requestService();

    if (serviceRequestResult) {
      final permissionGranted = await _locationService.permissionGranted();
      final permissionRequestResult = permissionGranted
          ? true
          : await _locationService.requestPermission() ==
              PermissionStatus.granted;

      if (permissionRequestResult) {
        final weatherData = await _locationService.requestLocationData();
        if (weatherData.$1 != null) {
          return emitFailureState(
              LocationServiceFailure(message: weatherData.$1!));
        } else {
          return weatherData.$2 != null
              ? _getCurrentWeather(weatherData.$2!)
              : emitFailureState(
                  DefaultFailure(),
                );
        }
      } else {
        return emitFailureState(
          LocationServiceFailure(message: Constants.locationPermissionDenied),
        );
      }
    } else {
      return emitFailureState(
        LocationServiceFailure(message: Constants.locationServiceUnenabled),
      );
    }
  }

  Future<void> _getCurrentWeather(LocationData data) async {
    _emitLoadingState(Constants.requestingWeatherData);

    final request = GetCurrentWeatherRequest(
      lat: data.latitude ?? 0,
      lon: data.longitude ?? 0,
      appid: Constants.appid,
      mode: Mode.json,
      units: Units.standard,
      lang: Lang.espanol,
    );

    final result = await _openWeatherMapApi.getCurrentWeather(request);

    if (result.$1 != null) {
      return emitFailureState(
        OpenWeatherMapApiFailure(message: result.$1!),
      );
    } else {
      return result.$2 != null
          ? emit(ShowingWeatherState(weatherData: result.$2!))
          : emitFailureState(DefaultFailure());
    }
  }

  Future<void> emitFailureState(Failure failure) async {
    return emit(
      ShowingFailureState(failure: failure),
    );
  }

  Future<void> _emitLoadingState(String message) async {
    return emit(LoadingState(message: message));
  }
}
