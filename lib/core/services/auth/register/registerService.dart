import 'package:dio/dio.dart';
import 'package:ekran/core/controllers/auth/block_status.dart';

class RegisterService {
  final String baseUrl = "http://ekran-env-2.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api/v1/";

  final dio = Dio();



  Future registerEmailCheck(String email) async {
    var response;
    try {
      response = await dio.get(baseUrl + "auth/app-user/emails/" + email);
      if (response.statusCode == 200) {
        if (response.data["data"]) {
          throw "error";
        }
      } else {
        throw "error";
      }
    } catch (e) {
      throw "error";
    }
  }
}
