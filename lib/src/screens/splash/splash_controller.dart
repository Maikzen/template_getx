import 'package:get/get.dart';
import 'package:template/src/contracts/local_data_interface.dart';

class SplashController extends GetxController {

  LocalDataInterface localDataInterface;
  
  SplashController({
    required this.localDataInterface
  });

  Future<String?> getUserToken() async {
    return await localDataInterface.getToken();
  }

  Future<bool> validateSession() async {
    String? token = await getUserToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
