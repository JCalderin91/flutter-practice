import 'dart:convert';

import 'package:api_rest_app/constans.dart';
import 'package:api_rest_app/domain/models/user_model.dart';
import 'package:api_rest_app/domain/repository/auth_repository.dart';
import 'package:api_rest_app/domain/response/login_response.dart';
import 'package:api_rest_app/domain/request/login_request.dart';
import 'package:http/http.dart' as http;

final _loginEndPoint = '/auth/login';
final _loginUrl = urlBase + _loginEndPoint;

class AuthRepositoryImpl extends AuthRepositoryInterface {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    var user;
    var token;
    try {
      var body = {
        "email": loginRequest.username,
        "password": loginRequest.password,
      };
      final http.Response response = await http.post(
        _loginUrl,
        body: body,
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        user = User.fromJson(jsonMap['user']);
        token = jsonMap['access_token'];
        return LoginResponse(token, user);
      } else {
        // TODO:  implementar para mensajes de error
      }
    } catch (Exception) {
      return LoginResponse(token, user);
    }
    return LoginResponse(token, user);
  }

  @override
  Future<void> logout(String token) async {}
}
