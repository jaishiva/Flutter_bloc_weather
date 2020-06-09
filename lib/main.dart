import 'package:bloc_advanced/bloc/weather_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/errorPage.dart';
import 'screens/initialPage.dart';
import 'screens/weatherPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: BlocProvider(
          create: (context) => WeatherBloc(),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a3d62),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                          child: Container(
                width: double.infinity,
                height: 200,
                 child : FlareActor(
                    'assets/space.flr',
                    animation: 'play',
                    fit: BoxFit.fill,
                  ),
              ),
            ),
            BlocBuilder<WeatherBloc,WeatherState>(
              builder: (context,state){
                if(state is WeatherInitial){
                  return InitialPage();
                }
                else if(state is WeatherLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(state is WeatherLoaded){
                  return WeatherPage(weather: state.weather);
                }
                else if(state is WeatherError){
                  return ErrorPage(error : state.error);
                }
              },
            )
          ],
        ),
      ),
      
    );
  
  }
  @override
  void dispose() {
    super.dispose();
  }
}
