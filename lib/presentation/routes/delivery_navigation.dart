import 'package:api_rest_app/presentation/home/home_binding.dart';
import 'package:api_rest_app/presentation/home/home_screen.dart';
import 'package:api_rest_app/presentation/login/login_biding.dart';
import 'package:api_rest_app/presentation/login/login_screen.dart';
import 'package:api_rest_app/presentation/splash/splash_binding.dart';
import 'package:api_rest_app/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginPage(),
      binding: LoginBiding(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
