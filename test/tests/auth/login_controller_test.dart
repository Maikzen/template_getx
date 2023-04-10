import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template/src/contracts/auth_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/screens/auth/login_controller.dart';

import '../../moks/auth.mocks.dart';
import '../../moks/local_data.mocks.dart';

@GenerateMocks([LocalDataInterface, AuthInterface])
main() {
  final localDataMock = MockLocalDataInterface();
  final authMock = MockAuthInterface();
  final loginController = LoginController(preferencesService: localDataMock, authService: authMock);

  test('Login controller login is ok', () async {

    when(authMock.login()).thenAnswer((_) async => 'token');
    when(localDataMock.setToken('token')).thenAnswer((_) async => true);

    var login = await loginController.login();

    expect(login, isNotNull);
  });

  test('Login controller login is not ok', () async {

    when(authMock.login()).thenAnswer((_) async => null);

    var login = await loginController.login();

    expect(login, isNull);
  });
}
