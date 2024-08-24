import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_response.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';

class ShowingWeatherView extends StatelessWidget {
  const ShowingWeatherView({
    super.key,
    required this.data,
    required this.onButtonPushed,
  });

  final GetCurrentWeatherResponse data;
  final VoidCallback onButtonPushed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final iconSize = mediaQuery.size.height * 0.15;
    return Container(
      height: mediaQuery.size.height * 0.8,
      width: mediaQuery.size.width * 0.9,
      child: Card(
        elevation: 4.0,
        color: theme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${data.sys?.country ?? 'Country'}, ${data.name ?? 'City'}',
              style: theme.textTheme.headlineLarge
                  ?.copyWith(color: theme.colorScheme.onPrimary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/img/weather-icon.png',
                      image:
                          'https://openweathermap.org/img/wn/${data.weather?.firstOrNull?.icon ?? ''}@2x.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    data.weather?.firstOrNull?.description ?? 'N/A',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                '${data.main?.temp ?? '--'}°',
                style: theme.textTheme.displayLarge
                    ?.copyWith(color: theme.colorScheme.onPrimary),
              ),
            ),
            OutlinedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(theme.colorScheme.onPrimary),
              ),
              onPressed: onButtonPushed,
              icon: Icon(
                Icons.date_range,
                color: theme.colorScheme.primary,
              ),
              label: Text(
                Constants.forecastButtonText,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
