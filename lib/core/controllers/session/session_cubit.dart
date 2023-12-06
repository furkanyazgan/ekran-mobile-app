import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionCubit extends Cubit<SessionState> {
  final authService = AuthService();

  SessionCubit() : super(SessionState(authenticatStatus: AuthenticatStatuses.UnknownSessionState)) {
    attemptAutoLogin();
  }



  void attemptAutoLogin() async {
    Map<String, dynamic> authData = await authService.getUserTokenAndUserID();
    print("Localde bulunan bilgi: ${authData}");

    if (authData["authToken"] != null) {
      emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
    } else {
      emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
    }

  }

  void showAuth() => emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Unauthenticated));

  void showSession() {
    emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
  }

  void signOut() async {
     await authService.signOut();
    emit(state.copyWith(authenticatStatus: AuthenticatStatuses.Unauthenticated));
  }
}
