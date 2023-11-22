import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SessionCubit extends Cubit<SessionState> {
  final  authService = AuthService();

  SessionCubit() : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      // final userId = await authRepo.attemptAutoLogin();
      // final user = dataRepo.getUser(userId);
      // final user = userId;
      await authService.attemptAutoLogin();
      emit(Authenticated(user: "user"));
    } on Exception {

      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession() {
    // AuthCredentials credentials***

    // // final user = dataRepo.getUser(credentials.userId);
    // final user = credentials.username;
    emit(Authenticated(user: "user"));
  }

  void signOut() {
    // authRepo.signOut();
    emit(Unauthenticated());
  }
}