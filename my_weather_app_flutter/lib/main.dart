import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_weather_app_flutter/services/location_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Weather App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final locationService = LocationService();
  String message = '';

  Future<void> obtainLocationData() async {
    setState(() {
      message = 'Getting Location Data...';
    });

    final serviceEnabled = await locationService.serviceEnabled();
    final serviceRequest = serviceEnabled ? true : await locationService.requestService();

    if(serviceRequest){
      final permissionGranted = await locationService.permissionGranted();
      final permissionRequest = permissionGranted ? true : await locationService.requestPermission() == PermissionStatus.granted;

      if(permissionRequest){
        final data = await locationService.requestLocationData();
        if (data.$1 != null) {
          message = 'Error obtaining data: ${data.$1}';
        } else {
          message =
          'latitude = ${data.$2?.latitude} longitude = ${data.$2?.longitude} ';
        }
      }else{
        message = 'Permission was not granted';
      }
    }else{
      message = 'Service is not enabled';
    }
    setState(() {});
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
            OutlinedButton(
                onPressed: obtainLocationData,
                child: const Text('Obtain Location Data'))
          ],
        ),
      ),
    );
  }
}
