import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/home.dart';

void main() {
  runApp(AppEntryPoint());
}

/// Represents the entry point of the application.
///
/// This class initializes the application and sets up the initial route.
class AppEntryPoint extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Define the routes for the application.
      routes: {
        "/": (BuildContext context) => HomeScreen()
      },
      // Set the initial route to the HomeScreen.
      initialRoute: "/",
    );
  }
}
