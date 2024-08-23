import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/weather.dart';

class Hourly {
  final int id;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<Weather> weather;
  final double pop;
  Hourly({
    required this.id,
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
    required this.pop,
  });

  Hourly copyWith({
    int? id,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    int? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
    double? pop,
  }) {
    return Hourly(
      id: id ?? this.id,
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
      pop: pop ?? this.pop,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      'pop': pop,
    };
  }

  factory Hourly.fromMap(Map<String, dynamic> map) {
    return Hourly(
      id: map['id'] as int,
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      dewPoint: map['dew_point'] as double,
      uvi: map['uvi'] as int,
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
      pop: map['pop'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hourly.fromJson(String source) =>
      Hourly.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hourly(id: $id, temp: $temp, feels_like: $feelsLike, pressure: $pressure, humidity: $humidity, dew_point: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, wind_speed: $windSpeed, wind_deg: $windDeg, wind_gust: $windGust, weather: $weather, pop: $pop)';
  }

  @override
  bool operator ==(covariant Hourly other) {
    if (identical(this, other)) return true;

    return other.id == id &&
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
        listEquals(other.weather, weather) &&
        other.pop == pop;
  }

  @override
  int get hashCode {
    return id.hashCode ^
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
        weather.hashCode ^
        pop.hashCode;
  }
}
