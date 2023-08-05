import "dart:convert";

import "package:http/http.dart" as http;

void main() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    var response = await http.get(url);

    print(response.body);

    Map<String, dynamic> jsonObjectFromRemote = jsonDecode(response.body);

    print(jsonObjectFromRemote['phone']);

    Uri multipleItemUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');

    var multipleResponses = await http.get(multipleItemUrl);

    print(multipleResponses.body);

    List<dynamic> jsonArrayFromRemote = jsonDecode(multipleResponses.body);

    print(jsonArrayFromRemote[0]);

    Uri postItemUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    String postRequestJsonBody = jsonEncode({"userId": "99","title": '雲育鏈', "body": '半夜寫程式，累啊。'});
    var postResponse = await http.post(postItemUrl, body: postRequestJsonBody);
    print(postResponse.body);
}