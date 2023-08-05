import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/home.dart';

void main() {
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        "/": (BuildContext context) => HomeScreen()
      },
      initialRoute: "/",
    );
  }
}