import 'package:api_rest_app/domain/repository/auth_repository.dart';
import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:api_rest_app/presentation/routes/delivery_navigation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController({
    this.localRepositoryInterface,
    this.authRepositoryInterface,
  });

  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;

  @override
  void onReady() {
    validateSesion();
    super.onReady();
  }

  void validateSesion() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }
}
