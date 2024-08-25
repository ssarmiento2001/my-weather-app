import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/utils/assets.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.indicatorSize,
    required this.imageSize,
  });

  final double indicatorSize;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: indicatorSize,
            width: indicatorSize,
            child: new CircularProgressIndicator(),
          ),
        ),
        Center(
          child: Container(
            height: imageSize,
            child: Image.asset(Assets.loadingImage),
          ),
        ),
      ],
    );
  }
}
