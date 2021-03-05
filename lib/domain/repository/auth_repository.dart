import 'package:api_rest_app/domain/request/login_request.dart';
import 'package:api_rest_app/domain/response/login_response.dart';

abstract class AuthRepositoryInterface {
  Future<LoginResponse> login(LoginRequst loginRequst);
  Future<void> logout(String token);
}
