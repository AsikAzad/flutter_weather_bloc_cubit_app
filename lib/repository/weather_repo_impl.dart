import 'package:flutter_weather_bloc_cubit_app/repository/weather_repo.dart';
import 'package:flutter_weather_bloc_cubit_app/services/web_service.dart';

import '../models/weather.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    return WebService().getWeatherByCity(cityName);
  }
}