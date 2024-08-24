import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_weather_app_flutter/model/enums/lang.dart';
import 'package:my_weather_app_flutter/model/enums/mode.dart';
import 'package:my_weather_app_flutter/model/enums/units.dart';
import 'package:my_weather_app_flutter/model/get_current_weather/get_current_weather_request.dart';
import 'package:my_weather_app_flutter/model/get_forecast/get_forecast_request.dart';
import 'package:my_weather_app_flutter/services/location_service.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/view/home_page_view/home_page_view.dart';
import 'package:my_weather_app_flutter/view/sample_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final locationService = LocationService();
  final openWeatherMapApi = OpenWeatherMapApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePageView(
              locationService: locationService,
              openWeatherMapApi: openWeatherMapApi,
            ),
        '/sample': (context) => const SampleView(
              message: 'sample',
            ),
      },
    );
  }
}

class HomePageExample extends StatefulWidget {
  const HomePageExample({super.key, required this.title});
  final String title;

  @override
  State<HomePageExample> createState() => _HomePageExampleState();
}

class _HomePageExampleState extends State<HomePageExample> {
  final locationService = LocationService();
  String message = '';
  bool requesting = false;
  LocationData? locationData;
  final api = OpenWeatherMapApi();
  static const String appid = 'db58f9b80807a12f6afb87b9f373036b';

  Future<void> obtainLocationData() async {
    setState(() {
      requesting = true;
      message = 'Getting Location Data...';
    });

    final serviceEnabled = await locationService.serviceEnabled();
    final serviceRequest =
        serviceEnabled ? true : await locationService.requestService();

    if (serviceRequest) {
      final permissionGranted = await locationService.permissionGranted();
      final permissionRequest = permissionGranted
          ? true
          : await locationService.requestPermission() ==
              PermissionStatus.granted;

      if (permissionRequest) {
        final data = await locationService.requestLocationData();
        if (data.$1 != null) {
          message = 'Error obtaining data: ${data.$1}';
        } else {
          message = '';
          locationData = data.$2;
        }
      } else {
        message = 'Permission was not granted';
      }
    } else {
      message = 'Service is not enabled';
    }
    setState(() {
      requesting = false;
    });
  }

  Future<void> getCurrentWeather() async {
    final request = GetCurrentWeatherRequest(
      lat: locationData!.latitude ?? 0,
      lon: locationData!.longitude ?? 0,
      appid: appid,
      mode: Mode.json,
      units: Units.standard,
      lang: Lang.english,
    );

    setState(() {
      requesting = true;
      message = 'Getting current weather...';
    });

    final result = await api.getCurrentWeather(request);

    if (result.$1 != null) {
      message = 'Error: ${result.$1}';
    } else {
      final weather = result.$2?.weather?.firstOrNull?.description;
      message = weather ?? 'Current Weather Success??';
    }

    setState(() {
      requesting = false;
    });
  }

  Future<void> getForecast() async {
    final request = GetForecastRequest(
      lat: locationData!.latitude ?? 0,
      lon: locationData!.longitude ?? 0,
      appid: appid,
      units: Units.standard,
      mode: Mode.json,
      cnt: 1,
      lang: Lang.english,
    );

    setState(() {
      requesting = true;
      message = 'Getting Forecast...';
    });

    final result = await api.getForecast(request);

    if (result.$1 != null) {
      message = 'Error: ${result.$1}';
    } else {
      final weather =
          result.$2?.list.firstOrNull?.weather?.firstOrNull?.description;
      message = weather ?? 'Forecast Success??';
    }

    setState(() {
      requesting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
            ),
            Text(locationData != null
                ? 'Latitude: ${locationData?.latitude} Longitude: ${locationData?.longitude}'
                : 'No location Data available'),
            OutlinedButton(
              onPressed: requesting ? null : obtainLocationData,
              child: const Text('Obtain location data'),
            ),
            OutlinedButton(
              onPressed: locationData != null && !requesting
                  ? getCurrentWeather
                  : null,
              child: const Text('Get current weather'),
            ),
            OutlinedButton(
              onPressed:
                  locationData != null && !requesting ? getForecast : null,
              child: const Text('Get forecast'),
            ),
          ],
        ),
      ),
    );
  }
}
