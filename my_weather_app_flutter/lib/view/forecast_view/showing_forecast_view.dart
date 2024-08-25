import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_response.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/view/widgets/forecast_list_item.dart';

class ShowingForecastView extends StatelessWidget {
  final GetForecastResponse data;
  ShowingForecastView({super.key, required this.data});

  List<Widget> _getListItems(ThemeData theme) {
    var initialTime = '';
    var currDay = '';
    return data.list.asMap().entries.map((entry) {
      {
        final idx = entry.key;
        final val = entry.value;

        final weather = val.weather?.firstOrNull;
        final dtTxt = val.dtTxt?.split(' ') ?? [];
        final day =
            dtTxt.length == 2 ? dtTxt.first : Constants.resourceNotFound;
        final time =
            dtTxt.length == 2 ? dtTxt.last : Constants.resourceNotFound;
        if (initialTime.isEmpty && time != Constants.resourceNotFound) {
          var temp = time.split(':');
          if (temp.isNotEmpty) {
            temp[0] = (((int.tryParse(temp.first) ?? 3) - 3) % 24).toString();
          }
          initialTime = temp.join(':');
        }
        final item = ForecastListItem(
          time: '$initialTime-$time',
          icon: weather?.icon ?? Constants.resourceNotFound,
          description: weather?.description ?? Constants.resourceNotFound,
          tempMin: '${val.main?.tempMin.toString() ?? ''}°',
          tempMax: '${val.main?.tempMax.toString() ?? ''}°',
        );
        initialTime = time;
        if (idx == 0 || (day != currDay && time != '00:00:00')) {
          currDay = day;
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
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = _getListItems(theme);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
        ),
      ],
    );
  }
}
