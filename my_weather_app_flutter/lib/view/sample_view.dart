import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  const SampleView({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
