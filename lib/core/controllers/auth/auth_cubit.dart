import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { startMain, login, signUpPersonal, preferredGenderConnect, connectionType, universityOrAround }

class AuthCubit extends Cubit<AuthState> {
  SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.startMain);
  final authService = AuthService();
  late AuthCredentials credentials = AuthCredentials();

  void showStartMainPage() => emit(AuthState.startMain);

  void showLoginPage() => emit(AuthState.login);

  void showSignUpPersonal() => emit(AuthState.signUpPersonal);

  void showUniversityOrAroundPage() => emit(AuthState.universityOrAround);

  void showPreferredGenderConnect() => emit(AuthState.preferredGenderConnect);

  void showConnectionType() => emit(AuthState.connectionType);

  Future<dynamic> loginUser() async {
    return await authService.loginPersonalUser(authCredentials: credentials).then((value) async {


       if (value["status"] == true) {
        await authService.authSetUserToken(token: value["token"]);
        sessionCubit.emit(sessionCubit.state.copyWith(authCredentials: credentials,
            authToken: value["token"],
            authenticatStatus: AuthenticatStatuses.Authenticated));
      }
      return value;
    });
  }

  void RegisterNewUser() {
    authService.registerPersonalUser(authCredentials: credentials);
  }

// void launchSession(AuthCredentials credentials) =>
//     sessionCubit.showSession(credentials);
}
