import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/weather_forecast.dart';

/// Represents a button for a specific location.
///
/// This button, when pressed, navigates the user to the `WeatherForecast` screen
/// for the specified location.
class LocationButton extends StatelessWidget {
  
  /// The name of the location that this button represents.
  String location;

  /// Creates a [LocationButton] with the given [location] name.
  LocationButton(this.location);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 219, 219, 219)),
      ),
      onPressed: () {
        // Navigate to the WeatherForecast screen for the specified location.
        Get.to(WeatherForecast(location)); 
      },
      child: Text(
        location,
        style: TextStyle(
          fontSize: 25,
          color: Colors.black
        ),
      ),
    );
  }
}
