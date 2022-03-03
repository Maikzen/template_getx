import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/src/contracts/compatibility_interface.dart';
import 'package:template/src/contracts/info_device_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/screens/splash/splash_controller.dart';

import '../../moks/compatibility.mocks.dart';
import '../../moks/info_device.mocks.dart';
import '../../moks/local_data.mocks.dart';

@GenerateMocks(
    [LocalDataInterface, InfoDeviceInterface, CompatibilityInterface])
main() {
  final localDataMock = MockLocalDataInterface();
  final compatibilityMock = MockCompatibilityInterface();
  final infoDeviceMock = MockInfoDeviceInterface();
  final splashController = SplashController(
    localDataInterface: localDataMock,
    compatibilityService: compatibilityMock,
    packageInfoService: infoDeviceMock,
  );

  test('Splash controller validate session is valid', () async {
    when(localDataMock.getToken()).thenAnswer((_) async => 'token');

    var validateSession = await splashController.validateSession();

    expect(validateSession, isTrue);
  });

  test('Splash controller validate session is invalid', () async {
    when(localDataMock.getToken()).thenAnswer((_) async => null);

    var validateSession = await splashController.validateSession();

    expect(validateSession, isFalse);
  });
}
