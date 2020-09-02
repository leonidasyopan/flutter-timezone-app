import 'package:flutter/material.dart';
import 'package:time_in_the_world/src/pages/home.dart';
import 'package:time_in_the_world/src/pages/loading.dart';
import 'package:time_in_the_world/src/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/choose_location': (context) => ChooseLocation(),
    }
  ));
}
