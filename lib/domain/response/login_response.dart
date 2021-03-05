import 'package:api_rest_app/domain/models/user_model.dart';

class LoginResponse {
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;
}
