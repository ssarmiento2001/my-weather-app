import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app_flutter/model/get_weather_request.dart';
import 'package:my_weather_app_flutter/model/get_weather_response.dart';

class OpenWeatherMapApi {
  Future<(String?, GetWeatherResponse?)> getCurrentWeather(
      GetWeatherRequest request) async {
    final client = http.Client();
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${request.lat}&lon=${request.lon}&appid=${request.appid}');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final getWeatherResponse = GetWeatherResponse.fromJson(
          const Utf8Decoder().convert(response.bodyBytes));

      return (null, getWeatherResponse);
    } else {
      return (response.statusCode.toString(), null);
    }
  }
}
