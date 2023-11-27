import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState {
  startMain,
  login,
  signUpPersonal,
  preferredGenderConnect,
  connectionType,
  universityOrAround,
  categories
}

class AuthCubit extends Cubit<AuthState> {
  SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.startMain);
  final authService = AuthService();
  late AuthCredentials credentials = AuthCredentials();

  void showStartMainPage() => emit(AuthState.startMain);

  void showLoginPage() => emit(AuthState.login);

  void showSignUpPersonal() {
    emit(AuthState.signUpPersonal);
  }

  void showCategoriesPage() => emit(AuthState.categories);

  void showUniversityOrAroundPage() => emit(AuthState.universityOrAround);

  void showPreferredGenderConnect() => emit(AuthState.preferredGenderConnect);

  void showConnectionType() => emit(AuthState.connectionType);

  void saveAuthTokenAndUserID({required String authToken, required String userID}) {
    authService.setUserTokenAndUserID(authToken: authToken, userID: userID);
    sessionCubit.emit(sessionCubit.state.copyWith(authToken: authToken, userID: userID));
  }

  Future<dynamic> loginUser() async {
    return await authService.loginPersonalUser(authCredentials: credentials).then((value) async {
      if (value["status"] == true) {
        saveAuthTokenAndUserID(authToken: value["token"], userID: value["userID"]);

        sessionCubit.emit(sessionCubit.state
            .copyWith(authCredentials: credentials, authenticatStatus: AuthenticatStatuses.Authenticated));
      }
      return value;
    });
  }

  Future<dynamic?> registerNewUser() async {
    return await authService.registerPersonalUser(authCredentials: credentials).then((value) {
      print(value);
      if (value["status"] == true) {
        saveAuthTokenAndUserID(authToken: value["token"], userID: value["userID"]);
        showConnectionType();
      }
      return value;
    });
  }

  Future<dynamic?> setVirtualConnectionType({required List<String> selectedVirtualConnectionTypeList}) async {
    return await authService
        .setVirtualConnectionType(
            selectedVirtualConnectionTypeList: selectedVirtualConnectionTypeList,
            token: sessionCubit.state.authToken!,
            userID: sessionCubit.state.userID!)
        .then((value) {
      print(value);
      if (value["status"] == true) {
        showCategoriesPage();
      }
      return value;
    });
  }



  Future<dynamic> setCategories({required List<String> selectedCategoriesList}) async {
    return await authService
        .setCategories(
            selectedCategoriesList: selectedCategoriesList,
            token: sessionCubit.state.authToken!,
            userID: sessionCubit.state.userID!)
        .then((value) {
      print(value);
      if (value["status"] == true) {
        sessionCubit.emit(sessionCubit.state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
      }
      return value;
    });
  }



}


