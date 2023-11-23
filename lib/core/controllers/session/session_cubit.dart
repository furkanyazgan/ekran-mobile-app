import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SessionCubit extends Cubit<SessionState> {
  final authService = AuthService();

  SessionCubit() : super(SessionState(authenticatStatus: AuthenticatStatuses.UnknownSessionState)) {
    attemptAutoLogin();
  }

  void attemptAutoLogin(){
    authService.attemptAutoLogin().then((value) {
      if (value["status"]) {
        emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
      } else {
        emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Unauthenticated));
      }
    });
  }

  void showAuth() => emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Unauthenticated));

  void showSession() {
    // AuthCredentials credentials***

    // // final user = dataRepo.getUser(credentials.userId);
    // final user = credentials.username;
    emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
  }

  void signOut() {
    // authRepo.signOut();
    emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Unauthenticated));
  }
}