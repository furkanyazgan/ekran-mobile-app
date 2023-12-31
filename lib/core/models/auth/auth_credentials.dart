import 'package:flutter/foundation.dart';

class AuthCredentials {
  final String? name;
  final String? surname;
  final String? email;
  final String? age;
  final List<int>? preferredAgeRanges;
  final String? gender;
  final String? preferredGender;
  final String? password;

  AuthCredentials({this.name, this.surname, this.email, this.age,this.preferredAgeRanges,this.gender, this.preferredGender, this.password});

  AuthCredentials copyWith({
    String? name,
    String? surname,
    String? email,
    String? age,
    List<int>? preferredAgeRanges,
    String? gender,
    String? preferredGender,
    String? password,
  }) {
    return AuthCredentials(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        age: age ?? this.age,
        preferredAgeRanges: preferredAgeRanges ?? this.preferredAgeRanges,
        gender: gender ?? this.gender,
        preferredGender: preferredGender ?? this.preferredGender,
        password: password ?? this.password);
  }
}
