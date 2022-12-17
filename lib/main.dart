import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc_cubit_app/cubit/weather_cubit.dart';
import 'package:flutter_weather_bloc_cubit_app/repository/weather_repo_impl.dart';
import 'package:flutter_weather_bloc_cubit_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepositoryImpl()),
        child: const HomeScreen(),
      ),
    );
  }
}
