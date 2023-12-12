import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolPersonalDetailsBloc extends Bloc<SchoolPersonalDetailsEvent, SchoolPersonalDetailsState> {
  final authService = AuthService();

  SchoolPersonalDetailsBloc() : super(const SchoolPersonalDetailsState()) {
    on<SchoolPersonalDetailsEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(SchoolPersonalDetailsEvent event, Emitter<SchoolPersonalDetailsState> emit) async {
    if (event is SchoolPersonalDetailsFistNameChanged) {
      emit(state.copyWith(firstName: event.firstName));
    } else if (event is SchoolPersonalDetailsButtonClick) {
      emit(state.copyWith(buttonClick: !state.buttonClick));
    } else if (event is SchoolPersonalDetailsLastNameChanged) {
      emit(state.copyWith(lastName: event.lastName));
    } else if (event is SchoolPersonalDetailsEmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is SchoolPersonalDetailsPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is SchoolPersonalDetailsFormStatusChanged) {
      emit(state.copyWith(formStatus: event.formStatus));
    } else if (event is SchoolPersonalDetailsGenderChanged) {
      emit(state.copyWith(gender: event.gender));
    } else if (event is SchoolPersonalDetailsAgeChanged) {
      emit(state.copyWith(age: event.age));
    } else if (event is SchoolPersonalDetailsSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      await authService.personalEmailDuplicateCheck(email: state.email).then((value) {
        if (value["status"]) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {
          emit(state.copyWith(formStatus: EmailDuplicateFailed()));
        }
      });
    }
  }
}
