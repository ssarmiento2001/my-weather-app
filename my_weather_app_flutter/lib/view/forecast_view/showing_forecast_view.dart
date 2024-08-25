import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_response.dart';
import 'package:my_weather_app_flutter/view/widgets/forecast_list_item.dart';

class ShowingForecastView extends StatelessWidget {
  final GetForecastResponse data;
  ShowingForecastView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var initialTime = '00:00:00';
    final items = data.list.map(
      (e) {
        final weather = e.weather?.firstOrNull;
        final dtTxt = e.dtTxt?.split(' ') ?? [];
        final day = dtTxt.length == 2 ? dtTxt.first : 'err';
        final time = dtTxt.length == 2 ? dtTxt.last : 'err';
        final item = ForecastListItem(
          time: '$initialTime-$time',
          icon: weather?.icon ?? 'err',
          description: weather?.description ?? 'err',
          tempMin: '${e.main?.tempMin.toString() ?? '0'}°',
          tempMax: '${e.main?.tempMax.toString() ?? '0'}°',
        );
        initialTime = time;
        if (time == '03:00:00') {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  day,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              item
            ],
          );
        } else {
          return item;
        }
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
