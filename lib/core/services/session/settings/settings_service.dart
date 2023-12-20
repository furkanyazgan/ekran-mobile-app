import 'dart:convert';
import 'dart:developer';

import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  // final String baseUrl = "http://ekran-env-2.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api";
  final String baseUrl = "http://localhost:8080/api";

  Future<dynamic> putSchoolUser({required Map<String, dynamic> body, required String token}) async {
    final uri = Uri.parse(baseUrl + "/v1/users/university-students");
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.put(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      var responseBody = json.decode(response.body);
      print(responseBody);

      if (response.statusCode == 200) {
        return {"status": true};
      } else {
        return {"status": false, "message": " "};
      }
    } catch (e) {
      print(e);
      return {"status": false, "message": " "};
    }
  }
}
