import 'package:api_rest_app/presentation/home/home_binding.dart';
import 'package:api_rest_app/presentation/home/home_screen.dart';
import 'package:api_rest_app/presentation/login/login_binding.dart';
import 'package:api_rest_app/presentation/login/login_screen.dart';
import 'package:api_rest_app/presentation/main_binding.dart';
import 'package:api_rest_app/presentation/product/product_screen.dart';
import 'package:api_rest_app/presentation/splash/splash_binding.dart';
import 'package:api_rest_app/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
  static final String product = '/product';
}

class DeliveryPages {
  static final pages = [
    GetPage(
        name: DeliveryRoutes.splash,
        page: () => SplashPage(),
        bindings: [MainBinding(), SplashBinding()]),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginPage(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomePage(),
      bindings: [MainBinding(), HomeBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.product,
      page: () => ProductPage(),
      // bindings: [MainBinding(), HomeBinding()],
    ),
  ];
}
