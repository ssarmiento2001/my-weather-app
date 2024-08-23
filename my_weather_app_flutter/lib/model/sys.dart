// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;
  Sys({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type'] != null ? map['type'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      sunrise: map['sunrise'] != null ? map['sunrise'] as int : null,
      sunset: map['sunset'] != null ? map['sunset'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) =>
      Sys.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(covariant Sys other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.id == id &&
        other.country == country &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        country.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}
