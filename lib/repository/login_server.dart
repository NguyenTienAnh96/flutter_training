import 'package:http/http.dart' as http;

import 'package:flutter_training/model/user.dart';

class LoginServer {
  static Future<bool> Signin(String username, String password) async {
    User_Post user = new User_Post(username: username, password: password);
    String url = "https://gardenex.herokuapp.com/user/authenticate";
    final res = await http.post(url,
        body: user.toJson(), headers: {'Accept': 'application/json'});
    print(res.body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
