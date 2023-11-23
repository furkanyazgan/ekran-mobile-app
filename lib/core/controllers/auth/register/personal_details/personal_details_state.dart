import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

class PersonalDetailsState extends Equatable {

  final bool buttonClick;

  final String firstName;

  bool get isValidFirstName => firstName.length > 3;

  final String lastName;

  bool get isValidLastName => lastName.length > 3;

  final String email;

  bool get isValidEmail => email.length > 3;

  final String password;

  bool get isValidPassword => password.length > 3;

  final String gender;

  final AppSubmissionStatus formStatus;

  const PersonalDetailsState(
      {this.buttonClick = false,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.password = "",
      this.gender = "",
      this.formStatus = const InitialStatus()});

  PersonalDetailsState copyWith({
    bool? buttonClick,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? gender,
    AppSubmissionStatus? formStatus,
  }) {
    return PersonalDetailsState(
        buttonClick: buttonClick ?? this.buttonClick,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object> get props => [buttonClick, firstName, lastName, email, password,gender, formStatus];
}
