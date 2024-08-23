import 'dart:convert';

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  FeelsLike copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return FeelsLike(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory FeelsLike.fromMap(Map<String, dynamic> map) {
    return FeelsLike(
      day: map['day'] as double,
      night: map['night'] as double,
      eve: map['eve'] as double,
      morn: map['morn'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromJson(String source) =>
      FeelsLike.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeelsLike(day: $day, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  bool operator ==(covariant FeelsLike other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.night == night &&
        other.eve == eve &&
        other.morn == morn;
  }

  @override
  int get hashCode {
    return day.hashCode ^ night.hashCode ^ eve.hashCode ^ morn.hashCode;
  }
}
