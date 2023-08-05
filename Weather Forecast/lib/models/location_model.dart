/*
  {
    locationName: '',
    weatherElement: [ <Weather> ]
  }
*/

import './weather_model.dart';

class Location {
  String locationName;
  List<Weather> weatherElement;

  Location({required this.locationName, required this.weatherElement});

  factory Location.fromJson(Map<String, dynamic> jsonObject) {
    return Location(
      locationName: jsonObject['locationName'],
      weatherElement: jsonObject['weatherElement']
                      .map<Weather>((items) {return Weather.fromJson(items);})
                      .toList()
    );
  }
}