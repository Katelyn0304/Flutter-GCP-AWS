/*
  {
    parameterName: '',
    parameterUnit: ''
  }
*/

class Parameter {
  String parameterName;
  String parameterUnit;

  Parameter({required this.parameterName, required this.parameterUnit});

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