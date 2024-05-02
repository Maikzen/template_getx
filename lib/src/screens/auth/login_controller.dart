import 'package:get/get.dart';
import 'package:template/src/contracts/auth_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';

class LoginController extends GetxController {
  AuthInterface authService;
  LocalDataInterface preferencesService;

  LoginController({
    required this.authService,
    required this.preferencesService,
  });

  Future<String?> login() async {
    String? token = await authService.login();
    if (token != null) {
      await preferencesService.setToken(token);
    }
    return token;
  }
}
