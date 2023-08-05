/*
  turn the return record in weather_dao.dart into
  [
    {
      locationName: '',
      weather: [
        {
          startTime: '',
          endTime: '',
          element: {
            Wx: '',
            Pop: '',
            MinT: '',
            CI: '',
            MaxT: ''
          }
        }
        ...
      ]
    }
  ]
*/

import '../models/location_model.dart';
import './daos/weather_dao.dart';

// The reason why I use 'dynamic' instead of creating a new 'class' is that
// this function is solely intended to change the weather records into a different arrangement.
// Therefore, I used two for loops to achieve this goal and wrote the output format on the top of this file.
class WeatherService {
  static Future<List<dynamic>> processWeatherRecords() async {
    List<Location> weatherRecords = await WeatherDao.getWeatherRecords();

    List<Map<String, dynamic>> processedWeatherRecords = [];

    for (int j = 0; j < weatherRecords.length; j++) {

      List<Map<String, dynamic>> weather = [
        {'startTime': '', 'endTime': '', 'element': {}},
        {'startTime': '', 'endTime': '', 'element': {}},
        {'startTime': '', 'endTime': '', 'element': {}}
      ];

      for (int i = 0; i < 3; i++) {
        Map<String, String> element = {'WX': '', 'PoP': '', 'MinT': '', 'CI': '', 'MaxT': ''};
        weather[i]['startTime'] = weatherRecords[0].weatherElement[0].timeElement[i].startTime;
        weather[i]['endTime'] = weatherRecords[0].weatherElement[0].timeElement[i].endTime;
        element['WX'] = weatherRecords[j].weatherElement[0].timeElement[i].parameter.parameterName;
        element['PoP'] = weatherRecords[j].weatherElement[1].timeElement[i].parameter.parameterName;
        element['MinT'] = weatherRecords[j].weatherElement[2].timeElement[i].parameter.parameterName;
        element['CI'] = weatherRecords[j].weatherElement[3].timeElement[i].parameter.parameterName;
        element['MaxT'] = weatherRecords[j].weatherElement[4].timeElement[i].parameter.parameterName;
        weather[i]['element'] = element;
      }
      processedWeatherRecords.add({'locationName': weatherRecords[j].locationName, 'weather': weather});
    }
    return(processedWeatherRecords);
  }
}
