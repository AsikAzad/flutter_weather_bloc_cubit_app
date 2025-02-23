import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc_cubit_app/cubit/weather_cubit.dart';
import 'package:flutter_weather_bloc_cubit_app/repository/weather_repo_impl.dart';
import 'package:flutter_weather_bloc_cubit_app/screens/components/data_home_screen.dart';
import 'package:flutter_weather_bloc_cubit_app/screens/components/initial_home_screen.dart';
import 'package:flutter_weather_bloc_cubit_app/screens/components/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Search"),
      ),
      body: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepositoryImpl()),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (context, state) {
              if (state is WeatherError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              print("Asik: " + state.toString());
              if (state is WeatherInitial) {
                return initialHomeScreen();
              } else if (state is WeatherLoading) {
                return loadingScreen();
              } else if (state is WeatherLoaded) {
                return dataHomeScreen(state.weather);
              } else {
                // (state is WeatherError)
                return initialHomeScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
