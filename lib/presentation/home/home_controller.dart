import 'package:api_rest_app/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:api_rest_app/domain/repository/products_repository.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ProductsRespositoryInterface productsRespositoryInterface;

  HomeController({
    this.localRepositoryInterface,
    this.productsRespositoryInterface,
  });

  @override
  void onReady() {
    fetchProducts();
    super.onReady();
  }

  RxList productList = [].obs;


  void fetchProducts() async {
    var products;
    try {
      final token = await localRepositoryInterface.getToken();
      products = await productsRespositoryInterface.getProducts(token);
      productList.assignAll(products);
    } catch (Exception) {
      // TODO: implementar mensajes de error
    }
  }

  Future<void> logout() async {
    await localRepositoryInterface.clearAllData();
  }
}
