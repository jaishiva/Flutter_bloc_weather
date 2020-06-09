import 'package:flutter/material.dart';

const TextStyle kErrorTextStyle = TextStyle(
  color: Colors.red,
  fontSize: 24,
  fontWeight: FontWeight.w500,
);
const TextStyle kTemperatureTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w500,
);
const TextStyle kTemperatureLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
const InputDecoration kCityInputDecoration = InputDecoration(
  hintText: 'Enter city name',
  hintStyle: kTemperatureLabelStyle,
  suffixIcon: Icon(Icons.search),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.white)
  ),
  enabledBorder:OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.blue)
  ) ,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.blue)
  )
);