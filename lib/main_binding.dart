import 'package:get/instance_manager.dart';
import 'package:template/src/contracts/compatibility_interface.dart';
import 'package:template/src/contracts/info_device_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/services/compatibility_service.dart';
import 'package:template/src/services/package_info_service.dart';
import 'package:template/src/services/preferences_service.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalDataInterface>(PreferencesService());
    Get.put<InfoDeviceInterface>(PackageInfoService());
    Get.put<CompatibilityInterface>(CompatibilityService());
  }
}
