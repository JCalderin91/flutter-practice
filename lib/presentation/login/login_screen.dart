import 'package:api_rest_app/components/custom_button.dart';
import 'package:api_rest_app/components/custom_text_field.dart';
import 'package:api_rest_app/presentation/login/login_controller.dart';
import 'package:api_rest_app/presentation/routes/delivery_navigation.dart';
import 'package:api_rest_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.toNamed(DeliveryRoutes.home);
    } else {
      Get.snackbar(
        'Error',
        'Ha ocurrido un error al intentar ingresar',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 0),
                    blurRadius: 30,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.hardLight,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Delivery App',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  CustomTextfield(
                    controller: controller.usernameTextController,
                    hint: 'Correo elétronico',
                    icon: Icon(Icons.people_alt),
                  ),
                  CustomTextfield(
                    controller: controller.passwordTextController,
                    hint: 'Contraseña',
                    icon: Icon(Icons.lock),
                  ),
                  const SizedBox(height: 5),
                  CustomButtom(
                    onPressed: login,
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  // CustomButtom(
                  //   onPressed: () {},
                  //   color: Colors.white,
                  //   textColor: kTextColor,
                  //   width: 40,
                  //   child: Image.asset(
                  //     'assets/images/search.png',
                  //     height: 18,
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                  Text(
                    'Si no tienes cuenta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  CustomButtom(
                    onPressed: () {},
                    color: Colors.black45,
                    // textColor: kTextColor,
                    child: Text(
                      'Registarte aqui',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
