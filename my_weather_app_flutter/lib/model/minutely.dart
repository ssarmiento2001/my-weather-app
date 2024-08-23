import 'dart:convert';

class Minutely {
  final int dt;
  final int precipitation;
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  Minutely copyWith({
    int? dt,
    int? precipitation,
  }) {
    return Minutely(
      dt: dt ?? this.dt,
      precipitation: precipitation ?? this.precipitation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'precipitation': precipitation,
    };
  }

  factory Minutely.fromMap(Map<String, dynamic> map) {
    return Minutely(
      dt: map['dt'] as int,
      precipitation: map['precipitation'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Minutely.fromJson(String source) =>
      Minutely.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Minutely(dt: $dt, precipitation: $precipitation)';

  @override
  bool operator ==(covariant Minutely other) {
    if (identical(this, other)) return true;

    return other.dt == dt && other.precipitation == precipitation;
  }

  @override
  int get hashCode => dt.hashCode ^ precipitation.hashCode;
}
