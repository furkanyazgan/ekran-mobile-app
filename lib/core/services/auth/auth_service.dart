import 'package:dio/dio.dart';

class AuthService {
  final String baseUrl =
      "http://ekran-env-2.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api/v1/";

  final dio = Dio();

  Future attemptAutoLogin() async {

    await Future.delayed(const Duration(seconds: 3));

    throw Exception("localde-token-yok");
  }

  Future register() async {
    print("servis çalıştı");
    await Future.delayed(const Duration(seconds: 3));
    print("servis durdu");
    throw Exception("register failed");
  }

  Future registerEmailCheck(String email) async {
    var response;
    try {
      response = await dio.get(baseUrl + "auth/app-user/emails/" + email);
      if (response.statusCode == 200) {
        print(email);
        print("sorgu başarılı");
        print(response.data["data"]);
      } else {
        print("sorgu başarısız");
      }
    } catch (e) {
      print(e);
    }
  }
}
