// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_weather_app_flutter/model/city.dart';
import 'package:my_weather_app_flutter/model/forecast_list.dart';

class GetForecastResponse {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastList> list;
  final City? city;
  GetForecastResponse({
    this.cod,
    this.message,
    this.cnt,
    required this.list,
    this.city,
  });

  GetForecastResponse copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ForecastList>? list,
    City? city,
  }) {
    return GetForecastResponse(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => x.toMap()).toList(),
      'city': city?.toMap(),
    };
  }

  factory GetForecastResponse.fromMap(Map<String, dynamic> map) {
    return GetForecastResponse(
      cod: map['cod'] != null ? map['cod'] as String : null,
      message: map['message'] != null
          ? int.tryParse(map['message'].toString()) ?? 0
          : null,
      cnt: map['cnt'] != null ? int.tryParse(map['cnt'].toString()) ?? 0 : null,
      list: List<ForecastList>.from(
        (map['list'] as List<dynamic>).map<ForecastList>(
          (x) => ForecastList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      city: map['city'] != null
          ? City.fromMap(map['city'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetForecastResponse.fromJson(String source) =>
      GetForecastResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetForecastResponse(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }

  @override
  bool operator ==(covariant GetForecastResponse other) {
    if (identical(this, other)) return true;

    return other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }
}
