import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_response.dart';
import 'package:my_weather_app_flutter/utils/assets.dart';
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
    return OrientationBuilder(builder: (context, orientation) {
      return Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColor,
                    theme.primaryColorDark,
                    theme.primaryColor,
                  ],
                ),
              ),
              width: mediaQuery.size.width,
              child: orientation == Orientation.portrait
                  ? PortraitContent(
                      data: data,
                      theme: theme,
                      iconSize: iconSize,
                      onButtonPushed: onButtonPushed)
                  : LandscapeContent(
                      data: data,
                      theme: theme,
                      iconSize: iconSize,
                      onButtonPushed: onButtonPushed),
            ),
          ),
        ],
      );
    });
  }
}

class LandscapeContent extends StatelessWidget {
  const LandscapeContent({
    super.key,
    required this.data,
    required this.theme,
    required this.iconSize,
    required this.onButtonPushed,
  });

  final GetCurrentWeatherResponse data;
  final ThemeData theme;
  final double iconSize;
  final VoidCallback onButtonPushed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Header(data: data, theme: theme, iconSize: iconSize * 1.5),
            WeatherChart(data: data, theme: theme),
          ],
        ),
        ForecastButton(theme: theme, onButtonPushed: onButtonPushed),
      ],
    );
  }
}

class ForecastButton extends StatelessWidget {
  const ForecastButton({
    super.key,
    required this.theme,
    required this.onButtonPushed,
  });

  final ThemeData theme;
  final VoidCallback onButtonPushed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(theme.colorScheme.onPrimary),
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
    );
  }
}

class PortraitContent extends StatelessWidget {
  const PortraitContent({
    super.key,
    required this.data,
    required this.theme,
    required this.iconSize,
    required this.onButtonPushed,
  });

  final GetCurrentWeatherResponse data;
  final ThemeData theme;
  final double iconSize;
  final VoidCallback onButtonPushed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Header(data: data, theme: theme, iconSize: iconSize),
        WeatherChart(data: data, theme: theme),
        ForecastButton(theme: theme, onButtonPushed: onButtonPushed),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.data,
    required this.theme,
    required this.iconSize,
  });

  final GetCurrentWeatherResponse data;
  final ThemeData theme;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${data.sys?.country ?? Constants.resourceNotFound}, ${data.name ?? Constants.resourceNotFound}',
          style: theme.textTheme.displayMedium
              ?.copyWith(color: theme.colorScheme.onPrimary),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: iconSize,
          width: iconSize,
          child: FadeInImage.assetNetwork(
            placeholder: Assets.placeholderImage,
            image:
                'https://openweathermap.org/img/wn/${data.weather?.firstOrNull?.icon ?? ''}@2x.png',
            fit: BoxFit.contain,
          ),
        ),
        Text(
          data.weather?.firstOrNull?.description ?? Constants.resourceNotFound,
          style: theme.textTheme.displaySmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class WeatherChart extends StatelessWidget {
  const WeatherChart({
    super.key,
    required this.data,
    required this.theme,
  });

  final GetCurrentWeatherResponse data;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final imgSize = MediaQuery.of(context).size.height * 0.1;
    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: imgSize,
                      child: Image.asset(
                        Assets.temperatureImage,
                      ),
                    ),
                  ),
                  Text(
                    '${data.main?.temp ?? ''}°',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Max: ${data.main?.tempMax ?? ''}° ',
                  style: theme.textTheme.displaySmall
                      ?.copyWith(color: theme.colorScheme.onPrimary),
                ),
                Text(
                  'Min: ${data.main?.tempMin ?? ''}°',
                  style: theme.textTheme.displaySmall
                      ?.copyWith(color: theme.colorScheme.onPrimary),
                ),
              ],
            ),
            Text(
              'Feels like ${data.main?.feelsLike ?? ''}°',
              style: theme.textTheme.displaySmall
                  ?.copyWith(color: theme.colorScheme.onPrimary),
            ),
            Text(
              'Humidity: ${data.main?.humidity ?? ''}%',
              style: theme.textTheme.displaySmall
                  ?.copyWith(color: theme.colorScheme.onPrimary),
            ),
          ],
        );
      },
    );
  }
}
