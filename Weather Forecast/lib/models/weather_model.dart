/*
  {
    elementName: '',
    timeElement: [ <Time> ]
  }
*/

import 'time_model.dart';

class Weather {
  String elementName;
  List<Time> timeElement;

  Weather({required this.elementName, required this.timeElement});

  factory Weather.fromJson(Map<String, dynamic> jsonObject) {
    return Weather(
      elementName: jsonObject['elementName'],
      timeElement: jsonObject['time']
              .map<Time>((items) {return Time.fromJson(items);})
              .toList(),
    );
  }
}