import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/weather.dart';

class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<Weather> weather;
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
  });

  Current copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
  }) {
    return Current(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((x) => x.toMap()).toList(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      dt: map['dt'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      dewPoint: map['dew_point'] as double,
      uvi: map['uvi'] as double,
      clouds: map['clouds'] as int,
      visibility: map['visibility'] as int,
      windSpeed: map['wind_speed'] as double,
      windDeg: map['wind_deg'] as int,
      windGust: map['wind_gust'] != null ? map['wind_gust'] as double : null,
      weather: List<Weather>.from(
        (map['weather'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Current(dt: $dt, sunrise: $sunrise, sunset: $sunset, temp: $temp, feels_like: $feelsLike, pressure: $pressure, humidity: $humidity, dew_point: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, wind_speed: $windSpeed, wind_deg: $windDeg, wind_gust: $windGust, weather: $weather)';
  }

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.dewPoint == dewPoint &&
        other.uvi == uvi &&
        other.clouds == clouds &&
        other.visibility == visibility &&
        other.windSpeed == windSpeed &&
        other.windDeg == windDeg &&
        other.windGust == windGust &&
        listEquals(other.weather, weather);
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode ^
        temp.hashCode ^
        feelsLike.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        dewPoint.hashCode ^
        uvi.hashCode ^
        clouds.hashCode ^
        visibility.hashCode ^
        windSpeed.hashCode ^
        windDeg.hashCode ^
        windGust.hashCode ^
        weather.hashCode;
  }
}
