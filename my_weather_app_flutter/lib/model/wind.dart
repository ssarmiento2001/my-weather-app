// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wind {
  final double speed;
  final int deg;
  final double gust;
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
      gust: map['gust'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';

  @override
  bool operator ==(covariant Wind other) {
    if (identical(this, other)) return true;

    return other.speed == speed && other.deg == deg && other.gust == gust;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode ^ gust.hashCode;
}
