import 'package:flutter/material.dart';

// Define the presentation format for the weather forecast results on weather forecast page

class WeatherComponent extends StatelessWidget {
  Map<String, dynamic> locationObject;

  WeatherComponent(this.locationObject);

  @override
  Widget build(BuildContext context) {
    final locationName = locationObject['locationName'];
    final List<dynamic> weather = locationObject['weather'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$locationName 未來天氣預報',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        for (var item in weather)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item['startTime']} ~ ${item['endTime']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('天氣現象: ${item['element']['WX']}', style: (TextStyle(fontSize: 15)),),
              Text('最高溫度: ${item['element']['MaxT']}', style: (TextStyle(fontSize: 15))),
              Text('最低溫度: ${item['element']['MinT']}', style: (TextStyle(fontSize: 15))),
              Text('舒適度: ${item['element']['CI']}', style: (TextStyle(fontSize: 15))),
              Text('降雨機率: ${item['element']['PoP']}', style: (TextStyle(fontSize: 15))),
              SizedBox(height: 16),
            ],
          ),
      ],
    );
  }
}