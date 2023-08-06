import './parameter_model.dart';

/// Represents a specific time interval and its associated weather parameter.
///
/// This class encapsulates the start and end times of a weather data interval
/// and a [Parameter] object that provides detailed information for that interval.
class Time {
  
  /// The start time of the weather data interval, in ISO format.
  String startTime;

  /// The end time of the weather data interval, in ISO format.
  String endTime;

  /// A [Parameter] object that provides detailed information for the time interval.
  Parameter parameter;

  /// Creates a [Time] with the given [startTime], [endTime], and [parameter].
  Time({required this.startTime, required this.endTime, required this.parameter});

  /// Creates a [Time] object from a JSON representation.
  ///
  /// The [jsonObject] parameter must contain the keys 'startTime', 'endTime', and 'parameter',
  /// where 'parameter' is a JSON object that can be converted to a [Parameter] instance.
  factory Time.fromJson(Map<String, dynamic> jsonObject) {
    return Time(
      startTime: jsonObject['startTime'],
      endTime: jsonObject['endTime'],
      parameter: Parameter.fromJson(jsonObject['parameter'])
    );
  }
}
