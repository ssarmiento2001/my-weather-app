// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coord {
  final double? lon;
  final double? lat;
  Coord({
    this.lon,
    this.lat,
  });

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'] != null
          ? double.tryParse(map['lon'].toString()) ?? 0
          : null,
      lat: map['lat'] != null
          ? double.tryParse(map['lat'].toString()) ?? 0
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) =>
      Coord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';

  @override
  bool operator ==(covariant Coord other) {
    if (identical(this, other)) return true;

    return other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}
