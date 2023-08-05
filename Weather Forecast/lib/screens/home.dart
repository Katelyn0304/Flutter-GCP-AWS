import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../components/location_buttom.dart';

// When pressing the location button on home page,
// it will pass a location parameter down and determine which weather object should be retrieved.
// Finally, the weather forecast results of that county/city will be presented on the weather forecast page.

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
      future: WeatherService.processWeatherRecords(), // Get weather records
      // The form of the list can be seen in services/weather_service.dart
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> asyncSnapshot) {

        if (asyncSnapshot.connectionState == ConnectionState.done) {
          List<dynamic>? records = asyncSnapshot.data;
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
                    // Create buttons that have each county/city name on it
                    for (int i = 0; i < length; i++)
                      LocationButton(records[i]['locationName'])
                  ],
                )
              )
          );
        } else {
          return Scaffold(body: Center(child: Text('Page not found.'),));
        }
      }
    );
  }
}