import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/src/routes.dart';
import 'package:template/src/screens/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Home'),
            TextButton(
              onPressed: logout,
              child: const Text('Logout'),
            ),
            TextButton(
              onPressed: chat,
              child: const Text('Chat'),
            )
          ],
        ),
      ),
    );
  }

  logout() async {
    bool logout = await controller.logout();
    if (logout) {
      Get.offNamed(Routes.login);
    }
  }

  chat() async {
    Get.toNamed(Routes.chat);
  }
}
