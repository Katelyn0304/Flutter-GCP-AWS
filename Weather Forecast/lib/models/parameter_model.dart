/// Represents a specific weather parameter and its unit.
///
/// This class encapsulates the name and unit of a weather parameter 
/// (e.g., temperature in Celsius).
class Parameter {
  
  /// The name of the weather parameter, e.g., "晴時多雲".
  String parameterName;

  /// The unit of the weather parameter, e.g., "C" for temperature.
  /// If the unit is not provided, it will be an empty string.
  String parameterUnit;

  /// Creates a [Parameter] with the given [parameterName] and [parameterUnit].
  Parameter({required this.parameterName, required this.parameterUnit});

  /// Creates a [Parameter] object from a JSON representation.
  ///
  /// The [jsonObject] parameter must contain the key 'parameterName'.
  /// The key 'parameterUnit' is optional and if not provided, it defaults to an empty string.
  factory Parameter.fromJson(Map<String, dynamic> jsonObject) {
    String parameterUnit;
    if (jsonObject['parameterUnit'] == null) {
      parameterUnit = '';
    } else {
      parameterUnit = jsonObject['parameterUnit'];
    }
    return Parameter(
      parameterName: jsonObject['parameterName'],
      parameterUnit: parameterUnit
    );
  }
}
