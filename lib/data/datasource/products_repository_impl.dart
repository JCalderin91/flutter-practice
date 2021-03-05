import 'dart:convert';

import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/domain/models/product_model.dart';
import 'package:api_rest_app/domain/repository/products_repository.dart';
import 'package:http/http.dart' as http;

final _url = '$urlBase/products';

class ProductsRepositoryImpl extends ProductsRespositoryInterface {
  @override
  Future<List<ProductModel>> getProducts(String token) async {
    var products;
    try {
      final http.Response response = await http.post(
        _url,
        headers: <String, String>{
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        products = ProductModel.fromJson(jsonMap);
      } else {
        print('no es 200');
      }
    } catch (Exception) {
      return products;
    }
    return products;
  }
}
