import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        WeatherModel _weather = await getWeatherData(event._cityName);
        yield WeatherLoaded(_weather);
      } catch (e) {
        if (e == Exception) {
          yield WeatherError(error: 'Error\nCity could not be found');
        } else {
          yield WeatherError(error: 'Error\nPlease check your Internet');
        }
      }
    }
  }
}

class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_min;
  final temp_max;
  final city;

  WeatherModel(
      {this.temp,
      this.pressure,
      this.humidity,
      this.temp_min,
      this.temp_max,
      this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> parsedJson) {
    return WeatherModel(
        temp: parsedJson['main']['temp'] - 273.15,
        humidity: parsedJson['main']['humidity'],
        pressure: parsedJson['main']['pressure'],
        temp_max: parsedJson['main']['temp_max'] - 273.15,
        temp_min: parsedJson['main']['temp_min'] - 273.15,
        city: parsedJson['name']);
  }
}

Future<WeatherModel> getWeatherData(cityName) async {
  String api = 'bd7d62ec612bb5310f2737776b7a0e17';
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api';
  try {
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception;
    } else {
      final body = json.decode(response.body);
      return WeatherModel.fromJson(body);
    }
  } catch (e) {
    throw e;
  }
}
