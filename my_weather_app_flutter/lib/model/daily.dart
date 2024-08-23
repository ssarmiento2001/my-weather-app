import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/feels_like.dart';
import 'package:my_weather_app_flutter/model/temp.dart';
import 'package:my_weather_app_flutter/model/weather.dart';

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final String summary;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double rain;
  final double uvi;
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  Daily copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    double? moonPhase,
    String? summary,
    Temp? temp,
    FeelsLike? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<Weather>? weather,
    int? clouds,
    double? pop,
    double? rain,
    double? uvi,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      summary: summary ?? this.summary,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      uvi: uvi ?? this.uvi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'summary': summary,
      'temp': temp.toMap(),
      'feelsLike': feelsLike.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds,
      'pop': pop,
      'rain': rain,
      'uvi': uvi,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      dt: map['dt'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
      moonrise: map['moonrise'] as int,
      moonset: map['moonset'] as int,
      moonPhase: map['moon_phase'] as double,
      summary: map['summary'] as String,
      temp: Temp.fromMap(map['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLike.fromMap(map['feelsLike'] as Map<String, dynamic>),
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      dewPoint: map['dew_point'] as double,
      windSpeed: map['wind_speed'] as double,
      windDeg: map['wind_deg'] as int,
      windGust: map['wind_gust'] != null ? map['wind_gust'] as double : null,
      weather: List<Weather>.from(
        (map['weather'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: map['clouds'] as int,
      pop: map['pop'] as double,
      rain: map['rain'] as double,
      uvi: map['uvi'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Daily(dt: $dt, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moon_phase: $moonPhase, summary: $summary, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dew_point: $dewPoint, wind_speed: $windSpeed, wind_deg: $windDeg, wind_gust: $windGust, weather: $weather, clouds: $clouds, pop: $pop, rain: $rain, uvi: $uvi)';
  }

  @override
  bool operator ==(covariant Daily other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.moonPhase == moonPhase &&
        other.summary == summary &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.dewPoint == dewPoint &&
        other.windSpeed == windSpeed &&
        other.windDeg == windDeg &&
        other.windGust == windGust &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.pop == pop &&
        other.rain == rain &&
        other.uvi == uvi;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode ^
        moonrise.hashCode ^
        moonset.hashCode ^
        moonPhase.hashCode ^
        summary.hashCode ^
        temp.hashCode ^
        feelsLike.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        dewPoint.hashCode ^
        windSpeed.hashCode ^
        windDeg.hashCode ^
        windGust.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        pop.hashCode ^
        rain.hashCode ^
        uvi.hashCode;
  }
}
