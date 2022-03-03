import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/src/routes.dart';
import 'package:template/src/screens/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => checkSession());
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }

  checkSession() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLogged = await controller.validateSession();
    if (isLogged) {
      Get.offNamed(Routes.home);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
