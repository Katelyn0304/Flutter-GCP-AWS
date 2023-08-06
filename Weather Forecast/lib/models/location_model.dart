import './weather_model.dart';

/// Represents a specific geographical location and its associated weather data.
///
/// This class encapsulates the name of a location and a list of [Weather] objects
/// that provide detailed weather information for that location.
class Location {
  
  /// The name of the location, e.g., "高雄市".
  String locationName;

  /// A list of [Weather] objects, each representing specific weather data
  /// for the location.
  List<Weather> weatherElement;

  /// Creates a [Location] with the given [locationName] and [weatherElement].
  Location({required this.locationName, required this.weatherElement});

  /// Creates a [Location] object from a JSON representation.
  ///
  /// The [jsonObject] parameter must contain the keys 'locationName' and 'weatherElement',
  /// where 'weatherElement' is a list of JSON objects that can be converted to
  /// [Weather] instances.
  factory Location.fromJson(Map<String, dynamic> jsonObject) {
    return Location(
      locationName: jsonObject['locationName'],
      weatherElement: jsonObject['weatherElement']
                      .map<Weather>((items) {return Weather.fromJson(items);})
                      .toList()
    );
  }
}
