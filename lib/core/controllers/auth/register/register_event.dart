import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterFistNameChanged extends RegisterEvent {
  final String? firstName;

  RegisterFistNameChanged({this.firstName});

  @override
  List<Object?> get props => [firstName];
}

class RegisterLastNameChanged extends RegisterEvent {
  final String? lastName;

  RegisterLastNameChanged({this.lastName});

  @override
  List<Object?> get props => [lastName];
}

class RegisterEmailChanged extends RegisterEvent {
  final String? email;

  RegisterEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String? password;

  RegisterPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class RegisterButtonClick extends RegisterEvent {


  @override
  List<Object?> get props => [ ];
}

class RegisterFormStatusChanged extends RegisterEvent {
  final AppSubmissionStatus? formStatus;

  RegisterFormStatusChanged({this.formStatus});

  @override
  List<Object?> get props => [formStatus];
}

class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
