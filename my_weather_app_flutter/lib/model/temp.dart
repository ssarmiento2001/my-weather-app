import 'dart:convert';

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: map['day'] as double,
      min: map['min'] as double,
      max: map['max'] as double,
      night: map['night'] as double,
      eve: map['eve'] as double,
      morn: map['morn'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) =>
      Temp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Temp(day: $day, min: $min, max: $max, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  bool operator ==(covariant Temp other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.min == min &&
        other.max == max &&
        other.night == night &&
        other.eve == eve &&
        other.morn == morn;
  }

  @override
  int get hashCode {
    return day.hashCode ^
        min.hashCode ^
        max.hashCode ^
        night.hashCode ^
        eve.hashCode ^
        morn.hashCode;
  }
}
