import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_response.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';

abstract class ForecastState {}

class RequestingForecastDataState extends ForecastState {}

class ShowingForecastState extends ForecastState {
  final GetForecastResponse forecastData;
  ShowingForecastState({required this.forecastData});
}

class ShowingFailureState extends ForecastState {
  final Failure failure;
  ShowingFailureState({required this.failure});
}
