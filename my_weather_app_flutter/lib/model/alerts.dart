import 'dart:convert';

import 'package:flutter/foundation.dart';

class Alerts {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;
  final List<String> tags;
  Alerts({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
    required this.tags,
  });

  Alerts copyWith({
    String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
    List<String>? tags,
  }) {
    return Alerts(
      senderName: senderName ?? this.senderName,
      event: event ?? this.event,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender_name': senderName,
      'event': event,
      'start': start,
      'end': end,
      'description': description,
      'tags': tags,
    };
  }

  factory Alerts.fromMap(Map<String, dynamic> map) {
    return Alerts(
      senderName: map['sender_name'] as String,
      event: map['event'] as String,
      start: map['start'] as int,
      end: map['end'] as int,
      description: map['description'] as String,
      tags: List<String>.from(
        (map['tags'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Alerts.fromJson(String source) =>
      Alerts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Alerts(sender_name: $senderName, event: $event, start: $start, end: $end, description: $description, tags: $tags)';
  }

  @override
  bool operator ==(covariant Alerts other) {
    if (identical(this, other)) return true;

    return other.senderName == senderName &&
        other.event == event &&
        other.start == start &&
        other.end == end &&
        other.description == description &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return senderName.hashCode ^
        event.hashCode ^
        start.hashCode ^
        end.hashCode ^
        description.hashCode ^
        tags.hashCode;
  }
}
