// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/clouds.dart';
import 'package:my_weather_app_flutter/model/main.dart';
import 'package:my_weather_app_flutter/model/rain_or_snow.dart';
import 'package:my_weather_app_flutter/model/sys.dart';
import 'package:my_weather_app_flutter/model/weather.dart';
import 'package:my_weather_app_flutter/model/wind.dart';

class ForecastList {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final RainOrSnow? rain;
  final RainOrSnow? snow;
  final Sys? sys;
  final String? dtTxt;
  ForecastList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.snow,
    this.sys,
    this.dtTxt,
  });

  ForecastList copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    RainOrSnow? rain,
    RainOrSnow? snow,
    Sys? sys,
    String? dtTxt,
  }) {
    return ForecastList(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      sys: sys ?? this.sys,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'main': main?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'clouds': clouds?.toMap(),
      'wind': wind?.toMap(),
      'visibility': visibility,
      'pop': pop,
      'rain': rain?.toMap(),
      'snow': snow?.toMap(),
      'sys': sys?.toMap(),
      'dt_txt': dtTxt,
    };
  }

  factory ForecastList.fromMap(Map<String, dynamic> map) {
    return ForecastList(
      dt: map['dt'] != null ? int.tryParse(map['dt'].toString()) ?? 0 : null,
      main: map['main'] != null
          ? Main.fromMap(map['main'] as Map<String, dynamic>)
          : null,
      weather: map['weather'] != null
          ? List<Weather>.from(
              (map['weather'] as List<dynamic>).map<Weather?>(
                (x) => Weather.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      clouds: map['clouds'] != null
          ? Clouds.fromMap(map['clouds'] as Map<String, dynamic>)
          : null,
      wind: map['wind'] != null
          ? Wind.fromMap(map['wind'] as Map<String, dynamic>)
          : null,
      visibility: map['visibility'] != null
          ? int.tryParse(map['visibility'].toString()) ?? 0
          : null,
      pop: map['pop'] != null
          ? double.tryParse(map['pop'].toString()) ?? 0
          : null,
      rain: map['rain'] != null
          ? RainOrSnow.fromMap(map['rain'] as Map<String, dynamic>)
          : null,
      snow: map['snow'] != null
          ? RainOrSnow.fromMap(map['snow'] as Map<String, dynamic>)
          : null,
      sys: map['sys'] != null
          ? Sys.fromMap(map['sys'] as Map<String, dynamic>)
          : null,
      dtTxt: map['dt_txt'] != null ? map['dt_txt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastList.fromJson(String source) =>
      ForecastList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ForecastList(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, rain: $rain, snow: $snow, sys: $sys, dt_txt: $dtTxt)';
  }

  @override
  bool operator ==(covariant ForecastList other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.rain == rain &&
        other.snow == snow &&
        other.sys == sys &&
        other.dtTxt == dtTxt;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        rain.hashCode ^
        snow.hashCode ^
        sys.hashCode ^
        dtTxt.hashCode;
  }
}
