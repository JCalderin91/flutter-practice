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
    print('fetchProducts');
    fetchProducts();
    super.onReady();
  }

  RxList productList = [].obs;

  void fetchProducts() async {
    var products;
    try {
      final token = await localRepositoryInterface.getToken();
      print(token);
      products = await productsRespositoryInterface.getProducts(token);
      print("Productos: $products");
      productList.assignAll(products);
    } catch (Exception) {
      print(Exception);
      print(products);
    }
  }
}
