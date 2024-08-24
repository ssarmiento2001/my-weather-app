// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ForecastListItem extends StatelessWidget {
  ForecastListItem({
    Key? key,
    required this.time,
    required this.icon,
    required this.description,
    required this.tempMin,
    required this.tempMax,
  }) : super(key: key);

  final String time;
  final String icon;
  final String description;
  final String tempMin;
  final String tempMax;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final iconSize = mediaQuery.size.width * 0.1;
    return Container(
      width: mediaQuery.size.width * 0.9,
      height: mediaQuery.size.height * 0.2,
      child: Card(
        color: theme.primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time),
            SizedBox(
              height: iconSize,
              width: iconSize,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/weather-icon.png',
                image: 'https://openweathermap.org/img/wn/$icon@2x.png',
                fit: BoxFit.contain,
              ),
            ),
            Text(description),
            Text(tempMax),
            Text(tempMin)
          ],
        ),
      ),
    );
  }
}
