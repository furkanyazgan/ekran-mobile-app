import 'dart:convert';
import 'dart:developer';

import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // final String baseUrl = "http://ekran-env-2.eba-cg8dvrqm.eu-north-1.elasticbeanstalk.com/api";
  final String baseUrl = "http://localhost:8080/api";

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("authToken");
    await prefs.remove("userID");
  }

  Future setUserTokenAndUserID({required String authToken, required String userID}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("authToken", authToken.toString());
    await prefs.setString("userID", userID.toString());
  }

  Future<Map<String, dynamic>> getUserTokenAndUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = await prefs.getString("authToken");
    String? userID = await prefs.getString("userID");
    return {"authToken": authToken, "userID": userID};
  }

  Future<dynamic> registerPersonalUser({required AuthCredentials authCredentials}) async {
    final uri = Uri.parse(baseUrl + "/v1/auth/app-user/register");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "name": authCredentials.name,
      "surname": authCredentials.surname,
      "email": authCredentials.email,
      "age": int.parse(authCredentials.age!),
      "preferredAgeRanges" : authCredentials.preferredAgeRanges,
      "gender": authCredentials.gender,
      "preferredGender": authCredentials.preferredGender,
      "password": authCredentials.password,
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          "status": true,
          "message": "created",
          "token": responseBody["data"]["token"],
          "userID": responseBody["data"]["userId"]
        };
      }
      if (response.statusCode == 409) {
        return {
          "status": false,
          "message": "duplicate_email",
        };
      } else {
        print(responseBody);
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


  Future<dynamic> registerSchoolUser({required AuthCredentials authCredentials}) async {
    final uri = Uri.parse(baseUrl + "/v1/auth/university-student/register");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "name": authCredentials.name,
      "surname": authCredentials.surname,
      "email": authCredentials.email,
      "age": int.parse(authCredentials.age!),
      "preferredAgeRanges" : authCredentials.preferredAgeRanges,
      "gender": authCredentials.gender,
      "preferredGender": authCredentials.preferredGender,
      "password": authCredentials.password,
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          "status": true,
          "message": "created",
          "token": responseBody["data"]["token"],
          "userID": responseBody["data"]["userId"]
        };
      }
      if (response.statusCode == 409) {
        return {
          "status": false,
          "message": "duplicate_email",
        };
      } else {
        print(responseBody);
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


  Future<dynamic> loginPersonalUser({AuthCredentials? authCredentials, String? email, String? password}) async {
    if (authCredentials != null) {
      email = authCredentials.email;
      password = authCredentials.password;
    }

    final uri = Uri.parse(baseUrl + "/v1/auth/app-user/authenticate");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"email": email, "password": password};

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
        return {
          "status": true,
          "message": "authenticated",
          "token": responseBody["data"]["token"],
          "userID": responseBody["data"]["userId"]
        };
      } else {
        return {"status": false, "message": "email_or_password_wrong"};
      }
    } catch (e) {
      return {"status": false, "message": "email_or_password_wrong"};
    }
  }

  Future<dynamic> personalEmailDuplicateCheck({AuthCredentials? authCredentials, String email = ""}) async {
    String temp_email = "";
    if (authCredentials == null) {
      temp_email = email;
    } else {
      temp_email = authCredentials.email!;
    }

    final uri = Uri.parse(baseUrl + "/v1/auth/app-user/emails/${temp_email}");
    final headers = {'Content-Type': 'application/json'};

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseBody["data"] == true) {
          print({"status": false, "message": "duplicate_email"});
          return {"status": false, "message": "duplicate_email"};
        } else {
          print({"status": true, "message": "email_not_found"});

          return {"status": true, "message": "email_not_found"};
        }
      }
    } catch (e) {
      print({"status": false, "message": "unknown"});

      return {"status": false, "message": "unknown"};
    }
  }

  Future<dynamic> setVirtualConnectionType(
      {required List<String> selectedVirtualConnectionTypeList, required String token,  }) async {
    final uri = Uri.parse(baseUrl + "/v1/matching/connection-types/university-students/virtual-connections");
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {  "virtualConnectionType": selectedVirtualConnectionTypeList};

    String jsonBody = jsonEncode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"status": true, "message": "created"};
      } else {
        return {"status": false, "message": "unknown"};
      }
    } catch (e) {
      return {"status": false, "message": "unknown"};
    }
  }

  Future<dynamic> setFaceToFaceConnectionType(
      {required List<String> selectedFaceToFaceConnectionTypeList, required String token, }) async {
    final uri = Uri.parse(baseUrl + "/v1/matching/connection-types/university-students/face-to-face-connections");
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {  "virtualConnectionType": selectedFaceToFaceConnectionTypeList};

    String jsonBody = jsonEncode(body);
    final encoding = Encoding.getByName('utf-8');

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"status": true, "message": "created"};
      } else {
        return {"status": false, "message": "unknown"};
      }
    } catch (e) {
      return {"status": false, "message": "unknown"};
    }
  }



  Future<dynamic> setCategories(
      {required List<String> selectedCategoriesList, required String token,}) async {
    final uri = Uri.parse(baseUrl + "/v1/matching/preferred-categories/university-students");
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {"categories": selectedCategoriesList};

    String jsonBody = jsonEncode(body);
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"status": true, "message": "created"};
      } else {
        return {"status": false, "message": "unknown"};
      }
    } catch (e) {
      return {"status": false, "message": "unknown"};
    }
  }

}
