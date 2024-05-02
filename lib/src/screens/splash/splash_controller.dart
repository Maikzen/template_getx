import 'dart:io';

import 'package:get/get.dart';
import 'package:template/src/contracts/compatibility_interface.dart';
import 'package:template/src/contracts/info_device_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/models/DTO/version_app_res.dart';
import 'package:version/version.dart';

enum StatusVersion { latest, updateAvailable, expired }

class SplashController extends GetxController {
  LocalDataInterface localDataInterface;
  InfoDeviceInterface packageInfoService;
  CompatibilityInterface compatibilityService;

  SplashController({
    required this.localDataInterface,
    required this.packageInfoService,
    required this.compatibilityService,
  });

  Future<bool> validateSession() async {
    String? token = await localDataInterface.getToken();
    return token != null;
  }

  Future<StatusVersion?> checkVersionApp() async {
    await packageInfoService.init();
    StatusVersion statusVersion = StatusVersion.latest;
    String? platform;
    if (Platform.isAndroid) {
      platform = 'android';
    }
    if (Platform.isIOS) {
      platform = 'ios';
    }
    if (platform != null) {
      VersionApp lastVersion =
          await compatibilityService.currentVersion(platform);
      String versionApp = packageInfoService.getVersionApp();

      Version latestVersion = Version.parse(lastVersion.currentVersion!);
      Version versionDevice = Version.parse(versionApp);
      if (latestVersion > versionDevice) {
        // Update available
        Version minVersion = Version.parse(lastVersion.minVersion!);
        if (minVersion > versionDevice) {
          // version expired
          statusVersion = StatusVersion.expired;
        } else {
          // update available
          statusVersion = StatusVersion.updateAvailable;
        }
      }
      return statusVersion;
    }
    return null;
  }
}
