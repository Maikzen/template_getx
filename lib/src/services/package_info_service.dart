import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/src/contracts/info_device_interface.dart';

class PackageInfoService extends GetxController implements InfoDeviceInterface {
  late PackageInfo _packageInfo;

  @override
  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String getBuildNumberApp() {
    return _packageInfo.version;
  }

  @override
  String getVersionApp() {
    return _packageInfo.buildNumber;
  }
}
