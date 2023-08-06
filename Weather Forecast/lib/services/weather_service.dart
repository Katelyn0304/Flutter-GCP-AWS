import './daos/weather_dao.dart';
import '../models/summary_model.dart';
import '../models/location_model.dart';

/// Provides services related to weather data.
///
/// This class offers methods to process and rearrange weather data
/// fetched from the data access object.
class WeatherService {
  
  /// Fetches and rearranges weather data for multiple locations.
  ///
  /// This method retrieves detailed weather records for various locations
  /// and then rearranges the data for each location, focusing on specific
  /// weather elements like temperature, weather conditions, etc.
  ///
  /// Returns:
  ///   A `Future` that completes with a list of [LocationSummary] objects,
  ///   each representing summarized weather data for a specific location.
  static Future<List<LocationSummary>> summary() async {
    List<Location> weatherRecords = await WeatherDao.getWeatherRecords();
    List<LocationSummary> summaries = [];

    for (int j = 0; j < weatherRecords.length; j++) {
      List<WeatherSummary> weatherSummaries = [];

      for (int i = 0; i < 3; i++) {
        weatherSummaries.add(
          WeatherSummary(
            startTime: weatherRecords[0].weatherElement[0].timeElement[i].startTime,
            endTime: weatherRecords[0].weatherElement[0].timeElement[i].endTime,
            element: ElementSummary(
              wx: weatherRecords[j].weatherElement[0].timeElement[i].parameter.parameterName,
              pop: weatherRecords[j].weatherElement[1].timeElement[i].parameter.parameterName,
              minT: weatherRecords[j].weatherElement[2].timeElement[i].parameter.parameterName,
              ci: weatherRecords[j].weatherElement[3].timeElement[i].parameter.parameterName,
              maxT: weatherRecords[j].weatherElement[4].timeElement[i].parameter.parameterName
            )
          )
        );
      }
      
      summaries.add(
        LocationSummary(
          locationName: weatherRecords[j].locationName,
          weather: weatherSummaries
        )
      );
    }
    return(summaries);
  }
}
