import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:equatable/equatable.dart';

abstract class PersonalDetailsEvent extends Equatable {}

class PersonalDetailsFistNameChanged extends PersonalDetailsEvent {
  final String? firstName;

  PersonalDetailsFistNameChanged({this.firstName});

  @override
  List<Object?> get props => [firstName];
}

class PersonalDetailsLastNameChanged extends PersonalDetailsEvent {
  final String? lastName;

  PersonalDetailsLastNameChanged({this.lastName});

  @override
  List<Object?> get props => [lastName];
}

class PersonalDetailsEmailChanged extends PersonalDetailsEvent {
  final String? email;

  PersonalDetailsEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class PersonalDetailsPasswordChanged extends PersonalDetailsEvent {
  final String? password;

  PersonalDetailsPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class PersonalDetailsButtonClick extends PersonalDetailsEvent {


  @override
  List<Object?> get props => [ ];
}

class PersonalDetailsFormStatusChanged extends PersonalDetailsEvent {
  final AppSubmissionStatus? formStatus;

  PersonalDetailsFormStatusChanged({this.formStatus});

  @override
  List<Object?> get props => [formStatus];
}


class PersonalDetailsGenderChanged extends PersonalDetailsEvent {
  final String? gender;

  PersonalDetailsGenderChanged({this.gender});

  @override
  List<Object?> get props => [gender];
}


class PersonalDetailsAgeChanged extends PersonalDetailsEvent {
  final String? age;

  PersonalDetailsAgeChanged({this.age});

  @override
  List<Object?> get props => [age];
}


class PersonalDetailsSubmitted extends PersonalDetailsEvent {
  @override
  List<Object?> get props => [];
}
