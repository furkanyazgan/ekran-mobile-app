import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/login/login_event.dart';
import 'package:ekran/core/controllers/auth/login/login_state.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authService = AuthService();
  final AuthCubit authCubit;

  LoginBloc({required this.authCubit}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginEmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginFormStatusChanged) {
      emit(state.copyWith(formStatus: event.formStatus));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
        authCubit.credentials = authCubit.credentials.copyWith(email: state.email, password: state.password);
        // print("email: ${authCubit.credentials.email} password: ${authCubit.credentials.password}");
      await authCubit.loginUser().then((value){

        if (value["status"] == true) {
          emit(state.copyWith(formStatus: SubmissionSuccess()));
        } else {

          emit(state.copyWith(formStatus: SubmissionFailed(message: value["message"])));
        }

      });
    }
  }
}
