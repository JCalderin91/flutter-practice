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
  Future<LoginResponse> login(LoginRequst loginRequst) async {
    var user;
    var token;
    try {
      final http.Response response = await http.post(
        _loginUrl,
        body: jsonEncode(loginRequst),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var userJsonMap = json.decode(jsonString).user;
        user = User.fromJson(userJsonMap);
        token = json.decode(jsonString).token;
      }
    } catch (Exception) {
      return LoginResponse(token, user);
    }
    return user;
  }

  @override
  Future<void> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
