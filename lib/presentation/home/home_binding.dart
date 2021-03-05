import 'package:api_rest_app/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        productsRespositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
