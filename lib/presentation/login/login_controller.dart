import 'package:api_rest_app/domain/repository/auth_repository.dart';
import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:api_rest_app/domain/request/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController({
    this.localRepositoryInterface,
    this.authRepositoryInterface,
  });

  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    try {
      final loginResponse = await authRepositoryInterface.login(
        LoginRequest(username, password),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      return true;
    } catch (Exception) {
      print(Exception);
      return false;
    }
  }
}
