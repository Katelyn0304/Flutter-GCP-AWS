import "dart:convert";

void main() {
    String jsonArrayOfString = """[1, 2, 3, 4, 5]""";

    List<dynamic> jsonArray = jsonDecode(jsonArrayOfString);

    for (int element in jsonArray) {
        print(element);
    }

    jsonArray.add(7);

    String jsonArrayToString = jsonEncode(jsonArray);

    print(jsonArray);
    print(jsonArrayToString);

    String jsonArrayOfJsonObjectString = """[{"name": "雲育鏈", "age": 18}, {"name": "小菜", "age": 25}, {"name": "小美", "age": 21}]""";

    List<dynamic> jsonArrayOfJsonObject = jsonDecode(jsonArrayOfJsonObjectString);

    print(jsonArrayOfJsonObject[0]['name']);

    for (Map<String, dynamic> jsonObject in jsonArrayOfJsonObject) {
        print(jsonObject);
    }

    jsonArrayOfJsonObject.add({"name": "Flutter 課程", "age": 1});

    String jsonArrayOfObjectToString = jsonEncode(jsonArrayOfJsonObject);

    print(jsonArrayOfObjectToString);

}