import 'dart:convert';
import 'dart:developer';

import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  final String baseUrl = "Ekran-env-1.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api";
  // final String baseUrl = "http://localhost:8080/api";

  Future<dynamic> getProfiles({required String token}) async {
    final uri = Uri.parse(baseUrl + "/v1/users/profiles");
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        print({"status": true, "data": responseBody["data"]});
        return {"status": true, "data": responseBody["data"]};
      } else {
        print({"status": false, "message": "unknown"});
        return {"status": false, "message": "unknown"};
      }
    } catch (e) {
      print({"status": false, "message": "unknown"});

      return {"status": false, "message": "unknown"};
    }
  }
}
