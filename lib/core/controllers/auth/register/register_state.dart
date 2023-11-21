import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String firstName;

  bool get isValidFirstName => firstName.length > 3;

  final String lastName;

  bool get isValidLastName => lastName.length > 3;

  final String email;

  bool get isValidEmail => firstName.length > 3;

  final String password;

  bool get isValidPassword => lastName.length > 3;

  final AppSubmissionStatus formStatus;

  const RegisterState(
      {this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.password = "",
      this.formStatus = const InitialStatus()});

  RegisterState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    AppSubmissionStatus? formStatus,
  }) {
    return RegisterState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object> get props => [firstName , lastName ,email,password ,formStatus];
}
