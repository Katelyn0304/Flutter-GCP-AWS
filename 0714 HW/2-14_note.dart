import "dart:convert";

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
        dynamic instanceMap = {"id": id, "name": name, "username": username, "email": email};
        return jsonEncode(instanceMap);
    }
}

void main() {
    User demoUser = User(1, "李秉鴻", "lbh", "service@cxcxc.io");

    print(demoUser.id);
    print(demoUser.name);
    print(demoUser.username);
    print(demoUser.email);
    demoUser.printUserInfo();
    print(demoUser.toJson());

    print("== == == == == 以準備好的 json string 去生成用戶物件 == == == == ==");

    String userJsonString = """{"id": 2, "name": "小美", "username": "xiaomei", "email": "cloud-master@cxcxc.io"}""";

    dynamic userJsonStringToDartDynamic = jsonDecode(userJsonString);

    User demoUser2 = User.fromJson(userJsonStringToDartDynamic);
    print(demoUser2.id);
    print(demoUser2.name);
    print(demoUser2.username);
    print(demoUser2.email);
    demoUser2.printUserInfo();
    print(demoUser2.toJson());  

    print("== == == == == 將 User 物件轉換成 json，並用此 json 去生成 User 物件");

    String userObjectTojsonString = demoUser.toJson();

    dynamic jsonStringToDartJson = jsonDecode(userObjectTojsonString);

    User demoUser3 = User.fromJson(jsonStringToDartJson);
    print(demoUser3.id);
    print(demoUser3.name);
    print(demoUser3.username);
    print(demoUser3.email);
    demoUser3.printUserInfo();
    print(demoUser3.toJson());  
}