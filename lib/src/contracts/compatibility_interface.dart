import 'package:template/src/models/DTO/version_app_res.dart';

abstract class CompatibilityInterface {
  Future<VersionApp> currentVersion(String platform);
}