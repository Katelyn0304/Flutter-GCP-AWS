class LocationSummary {
  String locationName;
  List<WeatherSummary> weather;

  LocationSummary({
    required this.locationName,
    required this.weather,
  });
}

class WeatherSummary {
  String startTime;
  String endTime;
  ElementSummary element;

  WeatherSummary({
    required this.startTime,
    required this.endTime,
    required this.element,
  });
}

class ElementSummary{
  String wx;
  String pop;
  String minT;
  String ci;
  String maxT;

  ElementSummary({
    required this.wx,
    required this.pop,
    required this.minT,
    required this.ci,
    required this.maxT
  });
}