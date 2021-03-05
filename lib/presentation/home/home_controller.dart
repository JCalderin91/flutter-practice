import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:api_rest_app/domain/repository/products_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    this.localRepositoryInterface,
    this.productsRespositoryInterface,
  });

  final LocalRepositoryInterface localRepositoryInterface;
  final ProductsRespositoryInterface productsRespositoryInterface;

  Future<bool> getProducts() async {
    var products;
    try {
      final token = await localRepositoryInterface.getToken();
      products = await productsRespositoryInterface.getProducts(token);
      return products;
    } catch (Exception) {
      print(Exception);
      return products;
    }
  }
}
