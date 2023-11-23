import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;

  bool get isValidEmail => email.length > 3;

  final String password;

  bool get isValidPassword => password.length > 3;

  final AppSubmissionStatus formStatus;

  const LoginState({this.email = "", this.password = "", this.formStatus = const InitialStatus()});

  LoginState copyWith({
    String? email,
    String? password,
    AppSubmissionStatus? formStatus,
  }) {
    return LoginState(
        email: email ?? this.email, password: password ?? this.password, formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object> get props => [email, password, formStatus];
}
