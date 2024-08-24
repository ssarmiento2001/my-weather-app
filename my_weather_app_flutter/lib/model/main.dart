// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] != null
          ? double.tryParse(map['temp'].toString()) ?? 0
          : null,
      feelsLike: map['feels_like'] != null
          ? double.tryParse(map['feels_like'].toString()) ?? 0
          : null,
      tempMin: map['temp_min'] != null
          ? double.tryParse(map['temp_min'].toString()) ?? 0
          : null,
      tempMax: map['temp_max'] != null
          ? double.tryParse(map['temp_max'].toString()) ?? 0
          : null,
      pressure: map['pressure'] != null
          ? int.tryParse(map['pressure'].toString()) ?? 0
          : null,
      humidity: map['humidity'] != null
          ? int.tryParse(map['humidity'].toString()) ?? 0
          : null,
      seaLevel: map['sea_level'] != null
          ? int.tryParse(map['sea_level'].toString()) ?? 0
          : null,
      grndLevel: map['grnd_level'] != null
          ? int.tryParse(map['grnd_level'].toString()) ?? 0
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)';
  }

  @override
  bool operator ==(covariant Main other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        seaLevel.hashCode ^
        grndLevel.hashCode;
  }
}
