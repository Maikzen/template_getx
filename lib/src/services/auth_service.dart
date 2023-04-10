import 'package:template/src/contracts/auth_interface.dart';

class AuthService implements AuthInterface{
  @override
  Future<String> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return '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';
  }
}