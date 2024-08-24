import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_response.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';

abstract class HomePageState {}

class InitializingState extends HomePageState {}

class LoadingState extends HomePageState {
  final String message;
  LoadingState({required this.message});
}

class ShowingWeatherState extends HomePageState {
  final GetCurrentWeatherResponse weatherData;
  ShowingWeatherState({required this.weatherData});
}

class ShowingFailureState extends HomePageState {
  final Failure failure;
  ShowingFailureState({required this.failure});
}
