import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/utils/assets.dart';
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
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Constants.showingFailureTitle,
            style: theme.textTheme.headlineLarge
                ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              height: size.height * 0.3,
              child: Image.asset(Assets.errorImage),
            ),
          ),
          Text(
            failure.message,
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
