import 'package:api_rest_app/domain/models/product_model.dart';
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
  Rx<ProductModel> productSelected = ProductModel.empty().obs;

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

  void selectProduct(ProductModel product) {
    productSelected(product);
  }

  Future<void> logout() async {
    await localRepositoryInterface.clearAllData();
  }
}
