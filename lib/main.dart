import 'package:flutter/material.dart';
import 'package:world/pages/choose_location.dart';
import 'package:world/pages/home.dart';
import 'package:world/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/choose_location": (context) => ChooseLocation()
    },
  ));
}
