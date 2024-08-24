import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app_flutter/bloc/home_page_bloc/home_page_cubit.dart';
import 'package:my_weather_app_flutter/bloc/home_page_bloc/home_page_state.dart';
import 'package:my_weather_app_flutter/services/location_service.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/view/sample_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView(
      {super.key,
      required LocationService locationService,
      required OpenWeatherMapApi openWeatherMapApi})
      : _locationService = locationService,
        _openWeatherMapApi = openWeatherMapApi;

  final LocationService _locationService;
  final OpenWeatherMapApi _openWeatherMapApi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample View'),
      ),
      body: BlocProvider(
        create: (context) => HomePageCubit(
          locationService: _locationService,
          openWeatherMapApi: _openWeatherMapApi,
        )..initialize(),
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            switch (state) {
              case InitializingState _:
                {
                  return const SampleView(
                    message: 'Initializing state',
                  );
                }
              case LoadingState _:
                {
                  return const SampleView(
                    message: 'Loading state',
                  );
                }
              case ShowingFailureState _:
                {
                  return const SampleView(
                    message: 'Showing failure state',
                  );
                }
              case ShowingWeatherState _:
                {
                  return const SampleView(
                    message: 'Showing weather state',
                  );
                }
              default:
                {
                  return const SampleView(
                    message: 'Default page',
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
