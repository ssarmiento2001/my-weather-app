// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RainOrSnow {
  final double? oneH;
  final double? threeH;
  RainOrSnow({
    this.oneH,
    this.threeH,
  });

  RainOrSnow copyWith({
    double? oneH,
    double? threeH,
  }) {
    return RainOrSnow(
      oneH: oneH ?? this.oneH,
      threeH: threeH ?? this.threeH,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '1h': oneH,
      '3h': threeH,
    };
  }

  factory RainOrSnow.fromMap(Map<String, dynamic> map) {
    return RainOrSnow(
      oneH: map['1h'] != null ? map['1h'] as double : null,
      threeH: map['3h'] != null ? map['3h'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RainOrSnow.fromJson(String source) =>
      RainOrSnow.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RainOrSnow(1h: $oneH, 3h: $threeH)';

  @override
  bool operator ==(covariant RainOrSnow other) {
    if (identical(this, other)) return true;

    return other.oneH == oneH && other.threeH == threeH;
  }

  @override
  int get hashCode => oneH.hashCode ^ threeH.hashCode;
}
