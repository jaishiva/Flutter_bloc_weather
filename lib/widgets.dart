import 'package:bloc_advanced/bloc/weather_bloc.dart';
import 'package:bloc_advanced/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherBloc _blocProvider = BlocProvider.of<WeatherBloc>(context);
    TextEditingController _textController;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: _textController,
        keyboardType: TextInputType.text,
        decoration: kCityInputDecoration,
        style: kTemperatureLabelStyle,
        autocorrect: false,
        onSubmitted: (value) {
          if (value != '') {_blocProvider.add(GetWeather(value));}
        },
      ),
    );
  }
}
