/*
  {
    startTime: '',
    endTime: '',
    parameter: { <Parameter> }
  }
*/

import 'parameter_model.dart';

class Time {
  String startTime;
  String endTime;
  Parameter parameter;
  
  Time({required this.startTime, required this.endTime, required this.parameter});

  factory Time.fromJson(Map<String, dynamic> jsonObject) {
    return Time(
      startTime: jsonObject['startTime'],
      endTime: jsonObject['endTime'],
      parameter: Parameter.fromJson(jsonObject['parameter'])
    );
  }
}