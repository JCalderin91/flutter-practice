// import 'package:api_rest_app/domain/models/product_model.dart';
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
    print('get product');
    getProducts();
    super.onInit();
  }

  // var product_list = List<ProductModel>().obs;

  void getProducts() async {
    var products;
    try {
      final token = await localRepositoryInterface.getToken();
      print(token);
      products = await productsRespositoryInterface.getProducts(token);
    } catch (Exception) {
      print(Exception);
      print(products);
    }
  }
}
