import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/weather.dart';
import '../repository/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on Exception {
      emit(const WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
