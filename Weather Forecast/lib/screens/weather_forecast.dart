import 'package:flutter/material.dart';
import '../components/weather_component.dart';
import '../models/summary_model.dart';
import '../services/weather_service.dart';

/// Represents the weather forecast screen for a specific location.
///
/// This screen fetches and displays the weather forecast for the specified location
/// using the [WeatherComponent].
class WeatherForecast extends StatefulWidget {
  
  /// The name of the location for which the weather forecast is to be displayed.
  String location;

  /// Creates a [WeatherForecast] screen for the given [location] name.
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
      // Fetch the arranged weather data for all locations.
      future: WeatherService.summary(),
      builder: (BuildContext context, AsyncSnapshot<List<LocationSummary>> asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.done) {
          LocationSummary locationObject = LocationSummary(locationName: '', weather: []);
          if (asyncSnapshot.hasData) {
            List<LocationSummary> locationSummaries = asyncSnapshot.data!;
            for (var item in locationSummaries) {
              // Find the locationObject which matches the pressed button.
              if (item.locationName == widget.location) {
                locationObject = item;
                break;
              }
            }
          }
          // Display the weather forecast for the specified location using the WeatherComponent.
          return Scaffold(
            appBar: AppBar(backgroundColor: Color.fromARGB(255, 239, 166, 93)),
            body: WeatherComponent(locationObject)
          );
        } else {
          // If the data fetching fails, display an error message.
          return Scaffold(body: Center(child: Text('Page not found.'),),);
        }
      },
    );
  }
}
