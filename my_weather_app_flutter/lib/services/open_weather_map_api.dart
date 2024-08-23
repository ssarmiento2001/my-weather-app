import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_request.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_response.dart';

class OpenWeatherMapApi {
  Future<(String?, GetCurrentWeatherResponse?)> getCurrentWeather(
      GetCurrentWeatherRequest request) async {
    final client = http.Client();
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${request.lat}&lon=${request.lon}&appid=${request.appid}&mode=${request.mode.value}&units=${request.units.value}&lang=${request.lang}');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final getCurrentWeatherResponse = GetCurrentWeatherResponse.fromJson(
          const Utf8Decoder().convert(response.bodyBytes));

      return (null, getCurrentWeatherResponse);
    } else {
      return (response.statusCode.toString(), null);
    }
  }
}
