import 'package:ekran/core/services/services.dart';

class RegisterService extends Service {
  Future register() async {
    await Future.delayed(const Duration(seconds: 3));

    throw Exception("register failed");
  }
}
