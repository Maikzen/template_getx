import 'package:get/get.dart';
import 'package:template/src/contracts/local_data_interface.dart';

class HomeController extends GetxController{

  LocalDataInterface preferencesService;

  HomeController({required this.preferencesService});

  Future<bool> logout() {
    return preferencesService.clearAllData();
  }
}