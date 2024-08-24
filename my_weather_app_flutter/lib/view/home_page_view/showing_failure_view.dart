import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';

class ShowingFailureView extends StatelessWidget {
  const ShowingFailureView({
    super.key,
    required this.failure,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Constants.showingFailureTitle,
          style: theme.textTheme.titleMedium,
        ),
        Text(
          failure.message,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
