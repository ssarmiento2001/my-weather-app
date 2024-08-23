import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/alerts.dart';
import 'package:my_weather_app_flutter/model/current.dart';
import 'package:my_weather_app_flutter/model/daily.dart';
import 'package:my_weather_app_flutter/model/hourly.dart';
import 'package:my_weather_app_flutter/model/minutely.dart';

class GetWeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;
  final List<Alerts> alerts;
  GetWeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  GetWeatherResponse copyWith({
    double? lat,
    double? lon,
    String? timezone,
    int? timezoneOffset,
    Current? current,
    List<Minutely>? minutely,
    List<Hourly>? hourly,
    List<Daily>? daily,
    List<Alerts>? alerts,
  }) {
    return GetWeatherResponse(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      current: current ?? this.current,
      minutely: minutely ?? this.minutely,
      hourly: hourly ?? this.hourly,
      daily: daily ?? this.daily,
      alerts: alerts ?? this.alerts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'timezone_offset': timezoneOffset,
      'current': current.toMap(),
      'minutely': minutely.map((x) => x.toMap()).toList(),
      'hourly': hourly.map((x) => x.toMap()).toList(),
      'daily': daily.map((x) => x.toMap()).toList(),
      'alerts': alerts.map((x) => x.toMap()).toList(),
    };
  }

  factory GetWeatherResponse.fromMap(Map<String, dynamic> map) {
    return GetWeatherResponse(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      timezone: map['timezone'] as String,
      timezoneOffset: map['timezone_offset'] as int,
      current: Current.fromMap(map['current'] as Map<String, dynamic>),
      minutely: List<Minutely>.from(
        (map['minutely'] as List<int>).map<Minutely>(
          (x) => Minutely.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hourly: List<Hourly>.from(
        (map['hourly'] as List<int>).map<Hourly>(
          (x) => Hourly.fromMap(x as Map<String, dynamic>),
        ),
      ),
      daily: List<Daily>.from(
        (map['daily'] as List<int>).map<Daily>(
          (x) => Daily.fromMap(x as Map<String, dynamic>),
        ),
      ),
      alerts: List<Alerts>.from(
        (map['alerts'] as List<int>).map<Alerts>(
          (x) => Alerts.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetWeatherResponse.fromJson(String source) =>
      GetWeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetWeatherResponse(lat: $lat, lon: $lon, timezone: $timezone, timezone_offset: $timezoneOffset, current: $current, minutely: $minutely, hourly: $hourly, daily: $daily, alerts: $alerts)';
  }

  @override
  bool operator ==(covariant GetWeatherResponse other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lon == lon &&
        other.timezone == timezone &&
        other.timezoneOffset == timezoneOffset &&
        other.current == current &&
        listEquals(other.minutely, minutely) &&
        listEquals(other.hourly, hourly) &&
        listEquals(other.daily, daily) &&
        listEquals(other.alerts, alerts);
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        lon.hashCode ^
        timezone.hashCode ^
        timezoneOffset.hashCode ^
        current.hashCode ^
        minutely.hashCode ^
        hourly.hashCode ^
        daily.hashCode ^
        alerts.hashCode;
  }
}
