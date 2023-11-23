import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}


class LoginEmailChanged extends LoginEvent {
  final String? email;

  LoginEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}


class LoginFormStatusChanged extends LoginEvent {
  final AppSubmissionStatus? formStatus;

  LoginFormStatusChanged({this.formStatus});

  @override
  List<Object?> get props => [formStatus];
}




class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}
