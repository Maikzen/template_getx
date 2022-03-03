import 'package:get/instance_manager.dart';
import 'package:template/src/screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(preferencesService: Get.find()));
  }
}
