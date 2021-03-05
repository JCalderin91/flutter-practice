import 'package:api_rest_app/domain/models/user_model.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
}
