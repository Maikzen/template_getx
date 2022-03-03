import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/screens/splash/splash_controller.dart';

import '../../moks/local_data.mocks.dart';

@GenerateMocks([LocalDataInterface])
main() {
  final localDataMock = MockLocalDataInterface();
  final splashController = SplashController(localDataInterface: localDataMock);

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
