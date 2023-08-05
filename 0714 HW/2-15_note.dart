import "dart:convert";

import "package:http/http.dart" as http;

class User {
    int id;
    String name;
    String username;
    String email;

    User(this.id, this.name, this.username, this.email);

    void printUserInfo() {
        print("用戶叫做$name, 用戶的帳號為$username, 用戶的id是$id, 用戶的信箱為$email");
    }

    factory User.fromJson(dynamic userJson) {
        int extractUserId = userJson["id"];
        String extractName = userJson["name"];
        String extractUserName = userJson["username"];
        String email = userJson["email"];
        return User(extractUserId, extractName, extractUserName, email);
    }

    String toJson() {
        dynamic instanceMap = {
        "id": id,
        "name": name,
        "username": username,
        "email": email
        };
        return jsonEncode(instanceMap);
    }
}

Future<List<User>> getRemoteSystemUserData() async {
    Uri multipleItemUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");

    http.Response remoteSystemResponses = await http.get(multipleItemUrl);

    List<dynamic> jsonArrayFromRemote = jsonDecode(remoteSystemResponses.body);

    List<User> userArray = jsonArrayFromRemote
        .map((dynamicUserJson) => User.fromJson(dynamicUserJson))
        .toList();

    return userArray;
}

void main() async {
    List<User> userArray = await getRemoteSystemUserData();

    print(userArray[0].toJson());

    print("====== 用戶數據 ======");

    Uri remoteSystemUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");

    String postData = userArray[0].toJson();
    http.Response postResponses =
        await http.post(remoteSystemUrl, body: postData);

    print(postResponses.body);
}