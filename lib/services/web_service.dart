import 'package:dio/dio.dart';
import 'package:flutter_weather_bloc_cubit_app/models/weather.dart';
import '../util/constant.dart';

class WebService {
  var dio = Dio();

  Future<Weather> getWeatherByCity(String cityName) async {
    var formData = FormData.fromMap({'cityName': cityName});

    final response = await dio.post(
      Constants.weatherUrl,
      data: formData,
    );

    if (response.statusCode == 200) {
      // print("API response\n" + response.toString());

      final result = response.data;

      return Weather.fromJson(result);
    } else {
      throw Exception("response failed");
    }
  }
}
