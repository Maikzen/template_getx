abstract class InfoDeviceInterface {
  Future<void> init();
  String getVersionApp();
  String getBuildNumberApp();
} 