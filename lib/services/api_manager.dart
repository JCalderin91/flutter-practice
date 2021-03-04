import 'dart:convert';

import 'package:api_rest_app/models/supizza.dart';
import 'package:http/http.dart' as http;

const supizzaUrl = '';

class ApiManager {
  Future<SupizzaModel> gerData() async {
    var client = http.Client();
    var supizzaModel;
    try {
      var response = await client.get(supizzaUrl);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        supizzaModel = SupizzaModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return supizzaModel;
    }
    return supizzaModel;
  }
}
