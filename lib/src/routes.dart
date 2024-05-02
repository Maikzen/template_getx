import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:template/src/screens/auth/login_binding.dart';
import 'package:template/src/screens/auth/login_screen.dart';
import 'package:template/src/screens/home/home_binding.dart';
import 'package:template/src/screens/home/home_screen.dart';
import 'package:template/src/screens/splash/splash_binding.dart';
import 'package:template/src/screens/splash/splash_screen.dart';


class Routes {

  Routes._();

  static const String home = '/home';
  static const String login = '/auth/login';
  static const String splash = '/splash';

  static final routes = <String, WidgetBuilder>{
    // Splash
    splash: (BuildContext context) => const SplashScreen(),
    // Home
    home: (BuildContext context) => const HomeScreen(),
    // Login
    login: (BuildContext context) => const LoginScreen(),
  };

  static final getRoutes = [
    // Splash
    GetPage(name: splash, page: () => const SplashScreen(), binding: SplashBinding()),
    // Home
    GetPage(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
    // Login
    GetPage(name: login, page: () => const LoginScreen(), binding: LoginBinding()),
  ];

}