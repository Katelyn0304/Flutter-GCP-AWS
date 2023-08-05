/*
  return
  [
    {
      locationName: '', ex 嘉義縣
      weatherElement: [
        {
          elementName: '', ex PoP
          timeElement: [
            {
              startTime: '', ex 2023-08-05 06:00:00
              endTime: '',
              parameter: {
                {
                  parameterName: '', ex 多雲短暫陣雨或雷雨 or 60
                  parameterUnit: '' ex 百分比 or C
                }
              }
            }
            ...
          ]
        }
        ...
      ]
    }
    ...
  ]
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/location_model.dart';

class WeatherDao {
  static Future<List<Location>> getWeatherRecords() async {
    const apiUrl =
        'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-8D3711CD-7B15-4C43-9B0A-40F12C3BE600';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Location> weatherRecords = jsonData['records']['location']
        .map<Location>((items) {return Location.fromJson(items);}).toList();

      return weatherRecords;

    } else {
      throw Exception('Failed to load weather data');
    }
  }
}