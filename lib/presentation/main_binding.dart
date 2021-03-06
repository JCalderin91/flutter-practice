import 'package:api_rest_app/data/datasource/auth_repository_impl.dart';
import 'package:api_rest_app/data/datasource/local_repository_impl.dart';
import 'package:api_rest_app/data/datasource/products_repository_impl.dart';
import 'package:api_rest_app/domain/repository/auth_repository.dart';
import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:api_rest_app/domain/repository/products_repository.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<AuthRepositoryInterface>(() => AuthRepositoryImpl());
    Get.lazyPut<ProductsRespositoryInterface>(() => ProductsRepositoryImpl());
  }
}
