import 'dart:convert';
import 'dart:developer';

import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;
import 'package:requests/requests.dart';

class AuthService {
  final String baseUrl = "http://ekran-env-2.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api/v1/";

  Future<dynamic> attemptAutoLogin() async{
    await Future.delayed(Duration(seconds: 2));
    return {"status":false};
  }

  Future<dynamic> registerPersonalUser({required AuthCredentials authCredentials}) async {
    final uri = Uri.parse(baseUrl + "auth/app-user/register");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "name": authCredentials.name,
      "surname": authCredentials.surname,
      "email": authCredentials.email,
      "age": authCredentials.age,
      "gender": authCredentials.gender,
      "preferredGender": authCredentials.preferredGender,
      "password": authCredentials.password
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          "status": true,
          "message": "created",
          "token": responseBody["data"]["token"],
        };
      }
      if (response.statusCode == 409) {
        return {
          "status": false,
          "message": "duplicate_email",
        };
      } else {
        return {
          "status": false,
          "message": "unknown",
        };
      }
    } catch (e) {
      return {
        "status": false,
        "message": "unknown",
      };
    }
  }

  Future<dynamic> loginPersonalUser({required AuthCredentials authCredentials}) async {
    final uri = Uri.parse(baseUrl + "auth/app-user/authenticate");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"email": authCredentials.email, "password": authCredentials.password};

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      var responseBody = json.decode(response.body);
      print(responseBody);

      if (response.statusCode == 200) {
        return {"status": true, "message": "authenticated", "token": responseBody["data"]["token"]};
      } else {
        return {"status": false, "message": "email_or_password_wrong"};
      }
    } catch (e) {
      return {"status": false, "message": "email_or_password_wrong"};
    }
  }

  Future<dynamic> personalEmailDuplicateCheck({  AuthCredentials? authCredentials,String email = ""}) async {

    String temp_email = "";
    if(authCredentials == null){
      temp_email = email;
    }else{
      temp_email = authCredentials.email!;
    }


    final uri = Uri.parse(baseUrl + "auth/app-user/emails/${temp_email}");
    final headers = {'Content-Type': 'application/json'};

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        if (responseBody["data"] == true) {
          return {"status": false, "message": "duplicate_email"};
        } else {
          return {"status": true, "message": "email_not_found"};
        }
      }
    } catch (e) {
      return {"status": false, "message": "unknown"};
    }
  }

  Future<dynamic> macth({required AuthCredentials authCredentials}) async {
    final uri = Uri.parse(baseUrl + "auth/app-user/authenticate");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"email": authCredentials.email, "password": authCredentials.password};

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return {"status": true, "message": "authenticated", "token": responseBody["data"]["token"]};
      } else {
        return {"status": false, "message": "email_or_password_wrong"};
      }
    } catch (e) {
      return {"status": false, "message": "email_or_password_wrong"};
    }
  }
}
