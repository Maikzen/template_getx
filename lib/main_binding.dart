import 'package:get/instance_manager.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/services/preferences_service.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalDataInterface>(PreferencesService());
  }
}
