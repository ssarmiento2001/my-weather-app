import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app_flutter/bloc/home_page_bloc/home_page_cubit.dart';
import 'package:my_weather_app_flutter/bloc/home_page_bloc/home_page_state.dart';
import 'package:my_weather_app_flutter/services/location_service.dart';
import 'package:my_weather_app_flutter/services/open_weather_map_api.dart';
import 'package:my_weather_app_flutter/utils/constants.dart';
import 'package:my_weather_app_flutter/utils/failure.dart';
import 'package:my_weather_app_flutter/view/home_page_view/initializing_view.dart';
import 'package:my_weather_app_flutter/view/home_page_view/loading_view.dart';
import 'package:my_weather_app_flutter/view/home_page_view/showing_failure_view.dart';
import 'package:my_weather_app_flutter/view/home_page_view/showing_weather_view.dart';

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
    final cubit = HomePageCubit(
      locationService: _locationService,
      openWeatherMapApi: _openWeatherMapApi,
    )..initialize();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Constants.homePageTitle),
        elevation: 10,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: cubit.refresh,
                child: const Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              switch (state) {
                case InitializingState _:
                  {
                    return const InitializingView();
                  }
                case LoadingState _:
                  {
                    return LoadingView(
                      message: state.message,
                    );
                  }
                case ShowingFailureState _:
                  {
                    return ShowingFailureView(failure: state.failure);
                  }
                case ShowingWeatherState _:
                  {
                    return ShowingWeatherView(data: state.weatherData);
                  }
                default:
                  {
                    return ShowingFailureView(
                      failure: InvalidStateFailure(),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
