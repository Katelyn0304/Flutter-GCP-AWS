import './time_model.dart';

/// Represents specific weather data for a given element.
///
/// This class encapsulates the name of a weather element (e.g., temperature)
/// and a list of [Time] objects that provide detailed time-based data for that element.
class Weather {
  
  /// The name of the weather element, e.g., "MaxT".
  String elementName;

  /// A list of [Time] objects, each representing specific time-based data
  /// for the weather element.
  List<Time> timeElement;

  /// Creates a [Weather] with the given [elementName] and [timeElement].
  Weather({required this.elementName, required this.timeElement});

  /// Creates a [Weather] object from a JSON representation.
  ///
  /// The [jsonObject] parameter must contain the keys 'elementName' and 'time',
  /// where 'time' is a list of JSON objects that can be converted to
  /// [Time] instances.
  factory Weather.fromJson(Map<String, dynamic> jsonObject) {
    return Weather(
      elementName: jsonObject['elementName'],
      timeElement: jsonObject['time']
              .map<Time>((items) {return Time.fromJson(items);})
              .toList(),
    );
  }
}
