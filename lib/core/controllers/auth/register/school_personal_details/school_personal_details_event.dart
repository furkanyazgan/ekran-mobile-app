import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

abstract class SchoolPersonalDetailsEvent extends Equatable {}

class SchoolPersonalDetailsFistNameChanged extends SchoolPersonalDetailsEvent {
  final String? firstName;

  SchoolPersonalDetailsFistNameChanged({this.firstName});

  @override
  List<Object?> get props => [firstName];
}

class SchoolPersonalDetailsLastNameChanged extends SchoolPersonalDetailsEvent {
  final String? lastName;

  SchoolPersonalDetailsLastNameChanged({this.lastName});

  @override
  List<Object?> get props => [lastName];
}

class SchoolPersonalDetailsEmailChanged extends SchoolPersonalDetailsEvent {
  final String? email;

  SchoolPersonalDetailsEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class SchoolPersonalDetailsPasswordChanged extends SchoolPersonalDetailsEvent {
  final String? password;

  SchoolPersonalDetailsPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class SchoolPersonalDetailsButtonClick extends SchoolPersonalDetailsEvent {


  @override
  List<Object?> get props => [ ];
}

class SchoolPersonalDetailsFormStatusChanged extends SchoolPersonalDetailsEvent {
  final AppSubmissionStatus? formStatus;

  SchoolPersonalDetailsFormStatusChanged({this.formStatus});

  @override
  List<Object?> get props => [formStatus];
}


class SchoolPersonalDetailsGenderChanged extends SchoolPersonalDetailsEvent {
  final String? gender;

  SchoolPersonalDetailsGenderChanged({this.gender});

  @override
  List<Object?> get props => [gender];
}


class SchoolPersonalDetailsAgeChanged extends SchoolPersonalDetailsEvent {
  final String? age;

  SchoolPersonalDetailsAgeChanged({this.age});

  @override
  List<Object?> get props => [age];
}

class SchoolPersonalDetailsSubmitted extends SchoolPersonalDetailsEvent {
  @override
  List<Object?> get props => [];
}
