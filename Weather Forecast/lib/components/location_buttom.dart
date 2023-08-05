import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/weather_forecast.dart';

// Create a button that can navigate to the weather forecast results of a certain county/city
// This widget is used home page
class LocationButton extends StatelessWidget {
  String location;

  LocationButton(this.location);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 219, 219, 219)),
      ),
      onPressed: () {
        // Navigate to the WeatherForecast widget, passing the 'location' parameter
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