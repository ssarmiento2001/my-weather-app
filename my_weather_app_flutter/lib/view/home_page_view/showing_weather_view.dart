import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_response.dart';

class ShowingWeatherView extends StatelessWidget {
  const ShowingWeatherView({
    super.key,
    required this.data,
  });

  final GetCurrentWeatherResponse data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${data.sys?.country ?? 'Country'}, ${data.name ?? 'City'}',
          style: theme.textTheme.titleSmall,
        ),
        Text(data.weather?.firstOrNull?.icon ?? 'Icon'),
        Text('${data.main?.temp ?? '--'}°'),
        Text(
          data.weather?.firstOrNull?.description ?? 'N/A',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
