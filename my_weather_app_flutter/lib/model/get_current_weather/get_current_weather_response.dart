// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_weather_app_flutter/model/clouds.dart';
import 'package:my_weather_app_flutter/model/coord.dart';
import 'package:my_weather_app_flutter/model/main.dart';
import 'package:my_weather_app_flutter/model/rain_or_snow.dart';
import 'package:my_weather_app_flutter/model/sys.dart';
import 'package:my_weather_app_flutter/model/weather.dart';
import 'package:my_weather_app_flutter/model/wind.dart';

class GetCurrentWeatherResponse {
  final Coord coord;
  final Weather weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;
  final RainOrSnow? rain;
  final RainOrSnow? snow;
  GetCurrentWeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
    this.rain,
    this.snow,
  });

  GetCurrentWeatherResponse copyWith({
    Coord? coord,
    Weather? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
    RainOrSnow? rain,
    RainOrSnow? snow,
  }) {
    return GetCurrentWeatherResponse(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord.toMap(),
      'weather': weather.toMap(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
      'rain': rain?.toMap(),
      'snow': snow?.toMap(),
    };
  }

  factory GetCurrentWeatherResponse.fromMap(Map<String, dynamic> map) {
    return GetCurrentWeatherResponse(
      coord: Coord.fromMap(map['coord'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'] as Map<String, dynamic>),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      clouds: Clouds.fromMap(map['clouds'] as Map<String, dynamic>),
      dt: map['dt'] as int,
      sys: Sys.fromMap(map['sys'] as Map<String, dynamic>),
      timezone: map['timezone'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      cod: map['cod'] as int,
      rain: map['rain'] != null
          ? RainOrSnow.fromMap(map['rain'] as Map<String, dynamic>)
          : null,
      snow: map['snow'] != null
          ? RainOrSnow.fromMap(map['snow'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCurrentWeatherResponse.fromJson(String source) =>
      GetCurrentWeatherResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetCurrentWeatherResponse(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod, rain: $rain, snow: $snow)';
  }

  @override
  bool operator ==(covariant GetCurrentWeatherResponse other) {
    if (identical(this, other)) return true;

    return other.coord == coord &&
        other.weather == weather &&
        other.base == base &&
        other.main == main &&
        other.visibility == visibility &&
        other.wind == wind &&
        other.clouds == clouds &&
        other.dt == dt &&
        other.sys == sys &&
        other.timezone == timezone &&
        other.id == id &&
        other.name == name &&
        other.cod == cod &&
        other.rain == rain &&
        other.snow == snow;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        clouds.hashCode ^
        dt.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode ^
        rain.hashCode ^
        snow.hashCode;
  }
}
