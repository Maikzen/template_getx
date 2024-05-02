import 'package:get/get.dart';
import 'package:template/src/contracts/auth_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';

class LoginController extends GetxController {
  AuthInterface authInterface;
  LocalDataInterface localDataInterface;

  LoginController({
    required this.authInterface,
    required this.localDataInterface,
  });

  Future<String?> login() async {
    String? token = await authInterface.login();
    if (token != null) {
      await localDataInterface.setToken(token);
    }
    return token;
  }
}
