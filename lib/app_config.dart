import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/main_binding.dart';
import 'package:template/src/providers/constants.dart';
import 'package:template/src/routes.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
      {super.key,required this.appDisplayName,
      required this.environment,
      required this.appInternalId,
      required this.stringResource,
      required super.child});

  final String appDisplayName;
  final String environment;
  final int appInternalId;
  final StringResource stringResource;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

abstract class StringResource {
  // Api URL
  String? apiUrl;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      initialBinding: MainBinding(),
      getPages: Routes.getRoutes,
    );
  }
}
