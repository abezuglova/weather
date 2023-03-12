import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_location_repository.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/pages/locations_weather_page/cubit/locations_weather_cubit.dart';
import 'package:weather_app/pages/locations_weather_page/screens/error_screen.dart';
import 'package:weather_app/pages/locations_weather_page/screens/loading_screen.dart';
import 'package:weather_app/pages/locations_weather_page/screens/locations_weather_screen.dart';

class LocationsWeatherPage extends StatelessWidget {
  const LocationsWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LocationsWeatherCubit>(
        create: (context) => LocationsWeatherCubit(
          weatherReportRepository: context.read<IWeatherReportRepository>(),
          locationRepository: context.read<ILocationRepository>(),
        )..onPageOpened(),
        child: BlocBuilder<LocationsWeatherCubit, LocationsWeatherState>(
          builder: (context, state) {
            if (state is LocationsWeatherLoadSuccess) {
              return LocationsWeatherScreen(
                  shortWeatherReports: state.shortWeatherReports);
            } else if (state is LocationsWeatherLoadFailure) {
              return const ErrorScreen();
            } else {
              return const LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
