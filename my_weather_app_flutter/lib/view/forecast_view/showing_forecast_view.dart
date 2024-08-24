import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_response.dart';
import 'package:my_weather_app_flutter/view/widgets/forecast_list_item.dart';

class ShowingForecastView extends StatelessWidget {
  final GetForecastResponse data;
  ShowingForecastView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final items = data.list.map(
      (e) {
        final weather = e.weather?.firstOrNull;
        return ForecastListItem(
          time: e.dtTxt ?? '',
          icon: weather?.icon ?? 'icon',
          description: weather?.description ?? 'description',
          tempMin: '${e.main?.tempMin.toString() ?? '0'}°',
          tempMax: '${e.main?.tempMax.toString() ?? '0'}°',
        );
      },
    ).toList();
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
