import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:my_weather_app_flutter/bloc/forecast_bloc/forecast_cubit.dart';
import 'package:my_weather_app_flutter/bloc/forecast_bloc/forecast_state.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';
import 'package:my_weather_app_flutter/view/forecast_view/showing_forecast_view.dart';
import 'package:my_weather_app_flutter/view/home_page_view/loading_view.dart';
import 'package:my_weather_app_flutter/view/home_page_view/showing_failure_view.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key, required OpenWeatherMapApi openWeatherMapApi})
      : _openWeatherMapApi = openWeatherMapApi;

  final OpenWeatherMapApi _openWeatherMapApi;

  @override
  Widget build(BuildContext context) {
    final locationData =
        ModalRoute.of(context)!.settings.arguments as LocationData;
    final cubit = ForecastCubit(
        locationData: locationData, openWeatherMapApi: _openWeatherMapApi)
      ..requestForecastData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Constants.forecastTitle),
        elevation: 10,
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<ForecastCubit, ForecastState>(
            builder: (context, state) {
              switch (state) {
                case RequestingForecastDataState _:
                  {
                    return LoadingView(
                      message: Constants.requestingForecastMessage,
                    );
                  }
                case ShowingFailureState _:
                  {
                    return ShowingFailureView(failure: state.failure);
                  }
                case ShowingForecastState _:
                  {
                    return ShowingForecastView(data: state.forecastData);
                  }
                default:
                  {
                    return ShowingFailureView(
                      failure: InvalidStateFailure(),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
