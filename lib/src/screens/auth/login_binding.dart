import 'package:get/instance_manager.dart';
import 'package:template/src/contracts/auth_interface.dart';
import 'package:template/src/screens/auth/login_controller.dart';
import 'package:template/src/services/auth_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthInterface>(() => AuthService());
    Get.lazyPut<LoginController>(
      () => LoginController(
        authService: Get.find(),
        preferencesService: Get.find(),
      ),
    );
  }
}
