import 'package:template/src/contracts/compatibility_interface.dart';
import 'package:template/src/models/DTO/version_app_res.dart';

class CompatibilityService implements CompatibilityInterface{
  @override
  Future<VersionApp> currentVersion(String platform) {
    return Future.value(VersionApp.defaultVersion());
  }

}