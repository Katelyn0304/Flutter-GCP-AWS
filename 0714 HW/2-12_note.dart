import "dart:convert";

import "package:http/http.dart" as http;

Future<List<dynamic>> getRemoteSystemData(String remoteUri) async {

    Uri multipleItemUrl = Uri.parse(remoteUri);

    http.Response multipleResponses = await http.get(multipleItemUrl);

    List<dynamic> jsonArrayFromRemote = jsonDecode(multipleResponses.body);

    return jsonArrayFromRemote;
}

void main() async {
    List<dynamic> jsonArrayResponse = await getRemoteSystemData('https://jsonplaceholder.typicode.com/users');

    print(jsonArrayResponse[0]);

    print(jsonArrayResponse[0]['username']);
    print(jsonArrayResponse[0]['email']);


    print(jsonArrayResponse[0]['family']);


    List<dynamic> jsonArrayResponse2 = await getRemoteSystemDataWithoutAsync('https://jsonplaceholder.typicode.com/users');


    print(jsonArrayResponse2[0]);

    print(jsonArrayResponse2[0]['username']);
    print(jsonArrayResponse2[0]['email']);

    print(jsonArrayResponse2[0]['family']);
}

Future<List<dynamic>> getRemoteSystemDataWithoutAsync(String remoteUri) {
    Uri multipleItemUrl = Uri.parse(remoteUri);

    Future<http.Response> multipleResponsesWithFuture = http.get(multipleItemUrl);

    Future<List<dynamic>> jsonArrayFromRemoteWithFuture = multipleResponsesWithFuture.then((multipleResponses) {
        return jsonDecode(multipleResponses.body);
    });

    return jsonArrayFromRemoteWithFuture;
}