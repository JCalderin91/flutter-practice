import 'dart:convert';
import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<User> gerData() async {
    var client = http.Client();
    var user;
    try {
      var response = await client.get(urlBase + '/auth/login');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        user = User.fromJson(jsonMap);
      }
    } catch (Exception) {
      return user;
    }
    return user;
  }
}
