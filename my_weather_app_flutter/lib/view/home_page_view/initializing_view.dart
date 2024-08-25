import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/view/widgets/custom_progress_indicator.dart';

class InitializingView extends StatelessWidget {
  const InitializingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final indicatorSize = size.height * 0.3;
    final imageSize = size.height * 0.2;
    return SizedBox(
      height: indicatorSize,
      child: CustomProgressIndicator(
          indicatorSize: indicatorSize, imageSize: imageSize),
    );
  }
}
