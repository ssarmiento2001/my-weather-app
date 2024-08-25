import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/view/widgets/custom_progress_indicator.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key, this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final indicatorSize = size.height * 0.3;
    final imageSize = size.height * 0.2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.5,
          child: CustomProgressIndicator(
              indicatorSize: indicatorSize, imageSize: imageSize),
        ),
        Text(
          message,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
