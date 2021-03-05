import 'package:api_rest_app/domain/request/login_request.dart';
import 'package:api_rest_app/domain/response/login_response.dart';

abstract class AuthRepositoryInterface {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
}
