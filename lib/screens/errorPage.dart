import 'package:bloc_advanced/constants.dart';
import 'package:bloc_advanced/widgets.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  ErrorPage({this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          error,
          style: kErrorTextStyle,
          textAlign: TextAlign.center,
        ),
        CityField()
      ],
    );
  }
}
