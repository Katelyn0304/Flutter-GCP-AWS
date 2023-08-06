import 'package:flutter/material.dart';
import '../models/summary_model.dart';

/// Represents a component that displays the weather forecast for a specific location.
///
/// This component displays the weather forecast details such as weather conditions,
/// temperature, and rain probability for the specified location.
class WeatherComponent extends StatelessWidget {
  
  /// Declare a `locationObject` to represent the weather forecast for a specific location.
  LocationSummary locationObject;

  /// Creates a [WeatherComponent] with the given [locationObject] containing the weather forecast details.
  WeatherComponent(this.locationObject);

  @override
  Widget build(BuildContext context) {
    final locationName = locationObject.locationName;
    final List<WeatherSummary> weather = locationObject.weather;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$locationName 未來天氣預報',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        // Display the weather forecast details for each time period.
        for (var item in weather)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item.startTime} ~ ${item.endTime}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('天氣現象: ${item.element.wx}', style: (TextStyle(fontSize: 15)),),
              Text('最高溫度: ${item.element.maxT}', style: (TextStyle(fontSize: 15))),
              Text('最低溫度: ${item.element.minT}', style: (TextStyle(fontSize: 15))),
              Text('舒適度: ${item.element.ci}', style: (TextStyle(fontSize: 15))),
              Text('降雨機率: ${item.element.pop}', style: (TextStyle(fontSize: 15))),
              SizedBox(height: 16),
            ],
          ),
      ],
    );
  }
}
