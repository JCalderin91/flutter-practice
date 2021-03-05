import 'package:api_rest_app/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        authRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
