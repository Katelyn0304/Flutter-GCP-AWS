import 'package:flutter/material.dart';
import '../models/summary_model.dart';
import '../services/weather_service.dart';
import '../components/location_buttom.dart';

/// Represents the home screen of the weather forecast application.
///
/// This screen displays a grid of buttons, each representing a location.
/// Users can tap on a location button to view the weather forecast for that location.
class HomeScreen extends StatefulWidget {

  @override
  State createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Fetch arranged weather data for all locations.
      future: WeatherService.summary(),
      builder: (BuildContext context, AsyncSnapshot<List<LocationSummary>> asyncSnapshot) {

        // If the data has been fetched successfully, display the grid of location buttons.
        if (asyncSnapshot.connectionState == ConnectionState.done) {
          List<LocationSummary>? records = asyncSnapshot.data;
          int length = records!.length;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 239, 166, 93),
              title: const Text('各縣市未來天氣預報查詢',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body:
              Container(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    // Create a button for each location.
                    for (int i = 0; i < length; i++)
                      LocationButton(records[i].locationName)
                  ],
                )
              )
          );
        } else {
          // If the data fetching fails, display an error message.
          return Scaffold(body: Center(child: Text('Page not found.'),));
        }
      }
    );
  }
}
