import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/enums/exclude.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';

class GetWeatherRequest {
  final double lat;
  final double lon;
  final String appid;
  final Set<Exclude>? exclude;
  final Units? units;
  final double? lang;
  GetWeatherRequest({
    required this.lat,
    required this.lon,
    required this.appid,
    this.exclude,
    this.units,
    this.lang,
  });

  GetWeatherRequest copyWith({
    double? lat,
    double? lon,
    String? appid,
    Set<Exclude>? exclude,
    Units? units,
    double? lang,
  }) {
    return GetWeatherRequest(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      appid: appid ?? this.appid,
      exclude: exclude ?? this.exclude,
      units: units ?? this.units,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'appid': appid,
      'exclude': exclude?.map((element) => element.value).toList().join(','),
      'units': units?.value,
      'lang': lang,
    };
  }

  factory GetWeatherRequest.fromMap(Map<String, dynamic> map) {
    return GetWeatherRequest(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      appid: map['appid'] as String,
      exclude: map['exclude']
          ?.toString()
          .replaceAll(' ', '')
          .split(',')
          .map((a) => Exclude.values
              .firstWhere((b) => a == b.value, orElse: () => Exclude.alerts))
          .toSet(),
      units: map['units'] != null
          ? Units.values.firstWhere(
              (element) => element.value == map['units'].toString(),
              orElse: () => Units.standard)
          : null,
      lang: map['lang'] != null ? map['lang'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetWeatherRequest.fromJson(String source) =>
      GetWeatherRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetWeatherRequest(lat: $lat, lon: $lon, appid: $appid, exclude: $exclude, units: $units, lang: $lang)';
  }

  @override
  bool operator ==(covariant GetWeatherRequest other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lon == lon &&
        other.appid == appid &&
        setEquals(other.exclude, exclude) &&
        other.units == units &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        lon.hashCode ^
        appid.hashCode ^
        exclude.hashCode ^
        units.hashCode ^
        lang.hashCode;
  }
}
