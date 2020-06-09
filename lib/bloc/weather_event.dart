part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {}

class GetWeather extends WeatherEvent{
final String _cityName;

  GetWeather(this._cityName);

  @override
  List<Object> get props => [];
}