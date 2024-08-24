import 'dart:convert';

import 'package:my_weather_app_flutter/model/enums/lang.dart';
import 'package:my_weather_app_flutter/model/enums/mode.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';

class GetForecastRequest {
  final double lat;
  final double lon;
  final String appid;
  final Units units;
  final Mode mode;
  final int cnt;
  final Lang lang;
  GetForecastRequest({
    required this.lat,
    required this.lon,
    required this.appid,
    required this.units,
    required this.mode,
    required this.cnt,
    required this.lang,
  });

  GetForecastRequest copyWith({
    double? lat,
    double? lon,
    String? appid,
    Units? units,
    Mode? mode,
    int? cnt,
    Lang? lang,
  }) {
    return GetForecastRequest(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      appid: appid ?? this.appid,
      units: units ?? this.units,
      mode: mode ?? this.mode,
      cnt: cnt ?? this.cnt,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'appid': appid,
      'units': units.value,
      'mode': mode.value,
      'cnt': cnt,
      'lang': lang.value,
    };
  }

  factory GetForecastRequest.fromMap(Map<String, dynamic> map) {
    return GetForecastRequest(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      appid: map['appid'] as String,
      units: Units.values.firstWhere(
          (element) => element.value == map['units'].toString(),
          orElse: () => Units.standard),
      mode: Mode.values.firstWhere(
          (element) => element.value == map['mode'].toString(),
          orElse: () => Mode.json),
      cnt: map['cnt'] as int,
      lang: Lang.values.firstWhere(
        (element) => element.value == map['lang'].toString(),
        orElse: () => Lang.english,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetForecastRequest.fromJson(String source) =>
      GetForecastRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetForecastRequest(lat: $lat, lon: $lon, appid: $appid, units: $units, mode: $mode, cnt: $cnt, lang: $lang)';
  }

  @override
  bool operator ==(covariant GetForecastRequest other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lon == lon &&
        other.appid == appid &&
        other.units == units &&
        other.mode == mode &&
        other.cnt == cnt &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        lon.hashCode ^
        appid.hashCode ^
        units.hashCode ^
        mode.hashCode ^
        cnt.hashCode ^
        lang.hashCode;
  }
}
