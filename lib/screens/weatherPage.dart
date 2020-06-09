import 'package:bloc_advanced/bloc/weather_bloc.dart';
import 'package:bloc_advanced/constants.dart';
import 'package:bloc_advanced/widgets.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  final WeatherModel weather;
  WeatherPage({this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weather.city,style: kErrorTextStyle,),
        Text('Current Temperature',style: kTemperatureLabelStyle,),
        Text('${weather.temp.toStringAsFixed(2)}',textAlign: TextAlign.center,style: kTemperatureTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Min',style: kTemperatureLabelStyle,),
                Text('${weather.temp_min.toInt()}',textAlign: TextAlign.center,style: kTemperatureTextStyle,),
              ],
            ),
            
            Column(
              children: [
                Text('Max',style: kTemperatureLabelStyle,),
                Text('${weather.temp_max.toInt()}',textAlign: TextAlign.center,style: kTemperatureTextStyle,),
              ],
            ),
            
          ],
        ),
        CityField()
      ],
    );
  }
}
