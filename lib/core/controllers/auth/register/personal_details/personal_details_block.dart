import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailsBloc extends Bloc<PersonalDetailsEvent, PersonalDetailsState> {
  final authService = AuthService();

  PersonalDetailsBloc() : super(const PersonalDetailsState()) {
    on<PersonalDetailsEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(PersonalDetailsEvent event, Emitter<PersonalDetailsState> emit) async {
    if (event is PersonalDetailsFistNameChanged) {
      emit(state.copyWith(firstName: event.firstName));
    } else if (event is PersonalDetailsButtonClick) {
      emit(state.copyWith(buttonClick: !state.buttonClick));
    } else if (event is PersonalDetailsLastNameChanged) {
      emit(state.copyWith(lastName: event.lastName));
    } else if (event is PersonalDetailsEmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is PersonalDetailsPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is PersonalDetailsFormStatusChanged) {
      emit(state.copyWith(formStatus: event.formStatus));
    } else if (event is PersonalDetailsGenderChanged) {
      emit(state.copyWith(gender: event.gender));
    } else if (event is PersonalDetailsSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      authService.personalEmailDuplicateCheck(email: state.email).then((value) {
        if (value["status"]) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {
          emit(state.copyWith(formStatus: EmailDuplicateFailed()));
        }
      });
    }
  }
}
