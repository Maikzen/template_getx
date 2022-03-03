import 'package:get/instance_manager.dart';
import 'package:template/src/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
        () => SplashController(localDataInterface: Get.find()));
  }
}
