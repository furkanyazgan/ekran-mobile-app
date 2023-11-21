import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/register_event.dart';
import 'package:ekran/core/controllers/auth/register/register_state.dart';
import 'package:ekran/core/services/auth/register/registerService.dart';
import 'package:ekran/core/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterService registerService = RegisterService();

  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is RegisterFistNameChanged) {
      emit(state.copyWith(firstName: event.firstName));
    } else if (event is RegisterLastNameChanged) {
      emit(state.copyWith(lastName: event.lastName));
    } else if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));
    }

    else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await registerService.register();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
