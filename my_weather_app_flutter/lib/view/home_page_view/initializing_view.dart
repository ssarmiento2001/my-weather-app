import 'package:flutter/material.dart';

class InitializingView extends StatelessWidget {
  const InitializingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    );
  }
}
