import 'package:flutter/material.dart';
import 'package:weather_forecast/components/weather_component.dart';
import '../services/weather_service.dart';

class WeatherForecast extends StatefulWidget {
  String location;

  WeatherForecast(this.location);

  @override
  State createState() {
    return _WeatherForecast();
  }
}

class _WeatherForecast extends State<WeatherForecast> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: WeatherService.processWeatherRecords(), // Get weather records
      // The form of the list can be seen in services/weather_service.dart
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.done) {
          // Define a map for the certain county/city weather forecast results
          Map<String, dynamic> locationObject = {};
          for (var item in asyncSnapshot.data ?? []) {
            // Find the certain county/city weather forecast results that match the pressed button
            if (item['locationName'] == widget.location) {
              locationObject = item;
            }
          }

          return Scaffold(
            appBar: AppBar(backgroundColor: Color.fromARGB(255, 239, 166, 93)),
            body: WeatherComponent(locationObject)
          );
        } else {
          return Scaffold(body: Center(child: Text('Page not found.'),),);
        }
      },
    );
  }
}