import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/pages/forecast_page/cubit/forecast_cubit.dart';
import 'package:weather_app/pages/forecast_page/screens/error_screen.dart';
import 'package:weather_app/pages/forecast_page/screens/forecast_screen.dart';
import 'package:weather_app/pages/forecast_page/screens/loading_screen.dart';

class ForecastPage extends StatelessWidget {
  final String locationName;
  const ForecastPage({super.key, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ForecastCubit>(
        create: (context) => ForecastCubit(
          context.read<IWeatherReportRepository>(),
        )..onPageOpened(locationName),
        child: SafeArea(
          child: Stack(
            children: [
              Expanded(
                child: BlocBuilder<ForecastCubit, ForecastState>(
                  builder: (context, state) {
                    if (state is ForecastLoadSuccess) {
                      return ForecastScreen(weatherReport: state.weatherReport);
                    } else if (state is ForecastLoadFailure) {
                      return const ErrorScreen();
                    } else {
                      return const LoadingScreen();
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
