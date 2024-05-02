import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/src/routes.dart';
import 'package:template/src/screens/auth/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login'),
            TextButton(
              onPressed: login,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  login() async {
    String? token = await controller.login();
    if (token != null) {
      Get.offNamed(Routes.home);
    }
  }
}
