import 'package:bloc_advanced/constants.dart';
import 'package:bloc_advanced/widgets.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Search for weather',style: kTemperatureLabelStyle,),
        CityField()
      ],
    );
  }
}