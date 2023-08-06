import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/location_model.dart';

/// Data access object for fetching weather records.
///
/// This class provides methods to retrieve weather data from a remote API.
class WeatherDao {
  
  /// Fetches a list of [Location] objects representing weather records.
  ///
  /// Makes an HTTP GET request to the specified API endpoint and parses
  /// the response to return a list of [Location] objects.
  ///
  /// Returns:
  ///   A `Future` that completes with a list of [Location] objects.
  ///
  /// Throws:
  ///   An [Exception] if there's any error fetching or parsing the data.
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
