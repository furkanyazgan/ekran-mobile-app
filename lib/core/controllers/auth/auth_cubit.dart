import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { login, signUp, preferredGenderConnect ,connectionType }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.signUp);

  late AuthCredentials credentials;

  void showLogin() => emit(AuthState.login);

  void showSignUp() => emit(AuthState.signUp);

  void showPreferredGenderConnect() => emit(AuthState.preferredGenderConnect);
  void showConnectionType() => emit(AuthState.connectionType);

// void launchSession(AuthCredentials credentials) =>
//     sessionCubit.showSession(credentials);
}
