import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final String cityName;
  final double temperatureCelsius;

  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        cityName: json['cityName'],
        temperatureCelsius: json['temp'],
        );
  }
    
  @override
  List<Object?> get props => [cityName, temperatureCelsius];
}