import 'package:my_weather_app_flutter/utils/constants.dart';

class Failure {
  final String message;
  Failure({required this.message});
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(message: Constants.defaultFailureMessage);
}

class InvalidStateFailure extends Failure {
  InvalidStateFailure() : super(message: Constants.invalidState);
}

class LocationServiceFailure extends Failure {
  LocationServiceFailure({required super.message});
}

class OpenWeatherMapApiFailure extends Failure {
  OpenWeatherMapApiFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}
