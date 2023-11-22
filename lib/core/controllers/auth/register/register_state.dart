import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool buttonClick;

  final String firstName;

  bool get isValidFirstName => firstName.length > 3;

  final String lastName;

  bool get isValidLastName => lastName.length > 3;

  final String email;

  bool get isValidEmail => email.length > 3;

  final String password;

  bool get isValidPassword => password.length > 3;

  final AppSubmissionStatus formStatus;

  const RegisterState(
      {this.buttonClick = false,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.password = "",
      this.formStatus = const InitialStatus()});

  RegisterState copyWith({
    bool? buttonClick,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    AppSubmissionStatus? formStatus,
  }) {
    return RegisterState(
        buttonClick: buttonClick ?? this.buttonClick,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object> get props =>
      [buttonClick, firstName, lastName, email, password, formStatus];
}
