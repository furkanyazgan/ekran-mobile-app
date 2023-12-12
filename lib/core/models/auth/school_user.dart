
class SchoolUserAuthorities {
/*
{
  "authority": "string"
}
*/

  String? authority;

  SchoolUserAuthorities({
    this.authority,
  });
  SchoolUserAuthorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['authority'] = authority;
    return data;
  }
}

class SchoolUser {
/*
{
  "id": "string",
  "name": "string",
  "surname": "string",
  "preferredAgeRanges": [
    0
  ],
  "age": 17,
  "gender": "MALE",
  "preferredGender": "MALE",
  "role": "APP_USER",
  "registeredAt": "2023-12-11T21:40:12.592Z",
  "updatedAt": "2023-12-11T21:40:12.592Z",
  "universityEmail": "string",
  "username": "string",
  "authorities": [
    {
      "authority": "string"
    }
  ],
  "accountNonExpired": true,
  "accountNonLocked": true,
  "credentialsNonExpired": true,
  "enabled": true
}
*/

  String? id;
  String? name;
  String? surname;
  List<int?>? preferredAgeRanges;
  int? age;
  String? gender;
  String? preferredGender;
  String? role;
  String? registeredAt;
  String? updatedAt;
  String? universityEmail;
  String? username;
  List<SchoolUserAuthorities?>? authorities;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? enabled;

  SchoolUser({
    this.id,
    this.name,
    this.surname,
    this.preferredAgeRanges,
    this.age,
    this.gender,
    this.preferredGender,
    this.role,
    this.registeredAt,
    this.updatedAt,
    this.universityEmail,
    this.username,
    this.authorities,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.enabled,
  });
  SchoolUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    if (json['preferredAgeRanges'] != null) {
      final v = json['preferredAgeRanges'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      preferredAgeRanges = arr0;
    }
    age = json['age']?.toInt();
    gender = json['gender']?.toString();
    preferredGender = json['preferredGender']?.toString();
    role = json['role']?.toString();
    registeredAt = json['registeredAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    universityEmail = json['universityEmail']?.toString();
    username = json['username']?.toString();
    if (json['authorities'] != null) {
      final v = json['authorities'];
      final arr0 = <SchoolUserAuthorities>[];
      v.forEach((v) {
        arr0.add(SchoolUserAuthorities.fromJson(v));
      });
      authorities = arr0;
    }
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    enabled = json['enabled'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    if (preferredAgeRanges != null) {
      final v = preferredAgeRanges;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['preferredAgeRanges'] = arr0;
    }
    data['age'] = age;
    data['gender'] = gender;
    data['preferredGender'] = preferredGender;
    data['role'] = role;
    data['registeredAt'] = registeredAt;
    data['updatedAt'] = updatedAt;
    data['universityEmail'] = universityEmail;
    data['username'] = username;
    if (authorities != null) {
      final v = authorities;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['authorities'] = arr0;
    }
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['enabled'] = enabled;
    return data;
  }
}