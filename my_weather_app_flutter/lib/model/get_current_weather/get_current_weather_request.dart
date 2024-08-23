// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_weather_app_flutter/model/enums/lang.dart';
import 'package:my_weather_app_flutter/model/enums/mode.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';

class GetCurrentWeatherRequest {
  final double lat;
  final double lon;
  final String appid;
  final Mode mode;
  final Units units;
  final Lang lang;
  GetCurrentWeatherRequest({
    required this.lat,
    required this.lon,
    required this.appid,
    required this.mode,
    required this.units,
    required this.lang,
  });

  GetCurrentWeatherRequest copyWith({
    double? lat,
    double? lon,
    String? appid,
    Mode? mode,
    Units? units,
    Lang? lang,
  }) {
    return GetCurrentWeatherRequest(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      appid: appid ?? this.appid,
      mode: mode ?? this.mode,
      units: units ?? this.units,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'appid': appid,
      'mode': mode.value,
      'units': units.value,
      'lang': lang.value,
    };
  }

  factory GetCurrentWeatherRequest.fromMap(Map<String, dynamic> map) {
    return GetCurrentWeatherRequest(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      appid: map['appid'] as String,
      mode: Mode.values.firstWhere(
          (element) => element.value == map['mode'].toString(),
          orElse: () => Mode.json),
      units: Units.values.firstWhere(
          (element) => element.value == map['units'].toString(),
          orElse: () => Units.standard),
      lang: Lang.values.firstWhere(
          (element) => element.value == map['lang'].toString(),
          orElse: () => Lang.english),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCurrentWeatherRequest.fromJson(String source) =>
      GetCurrentWeatherRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetCurrentWeatherRequest(lat: $lat, lon: $lon, appid: $appid, mode: $mode, units: $units, lang: $lang)';
  }

  @override
  bool operator ==(covariant GetCurrentWeatherRequest other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lon == lon &&
        other.appid == appid &&
        other.mode == mode &&
        other.units == units &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        lon.hashCode ^
        appid.hashCode ^
        mode.hashCode ^
        units.hashCode ^
        lang.hashCode;
  }
}
