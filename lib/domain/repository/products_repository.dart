import 'package:api_rest_app/domain/models/product_model.dart';

abstract class ProductsRespositoryInterface {
  Future<List<ProductModel>> getProducts(String token);
}
