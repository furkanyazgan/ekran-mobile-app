import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState {
  startMain,
  login,
  signUpPersonal,
  signUpSchoolPersonal,
  preferredGenderConnect,
  schoolPreferredGenderConnect,
  connectionType,
  schoolConnectionType,
  universityOrAround,
  categories,
  schoolCategories,
  schoolOutlinePage
}

class AuthCubit extends Cubit<AuthState> {
  SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.startMain);
  final authService = AuthService();
  late AuthCredentials credentials = AuthCredentials();

  void showStartMainPage() => emit(AuthState.startMain);

  void showPersonalDetailsPage() => emit(AuthState.signUpPersonal);

  void showSchoolPersonalDetailsPage() => emit(AuthState.signUpSchoolPersonal);

  void showLoginPage() => emit(AuthState.login);

  void showSignUpPersonal() {
    emit(AuthState.signUpPersonal);
  }

  void showCategoriesPage() => emit(AuthState.categories);

  void showUniversityOrAroundPage() => emit(AuthState.universityOrAround);

  void showPreferredGenderConnect() => emit(AuthState.preferredGenderConnect);

  void showSchoolPreferredGenderConnect() => emit(AuthState.schoolPreferredGenderConnect);

  void showConnectionType() => emit(AuthState.connectionType);
  void showSchoolOutlinePage() => emit(AuthState.schoolOutlinePage);

  void showSchoolConnectionType() => emit(AuthState.schoolConnectionType);

  void saveAuthTokenAndUserID({required String authToken, required String userID}) {
    authService.setUserTokenAndUserID(authToken: authToken, userID: userID);
    sessionCubit.emit(sessionCubit.state.copyWith(authToken: authToken, userID: userID));
  }

  Future<dynamic> loginUser() async {
    return await authService.loginSchoolUser(authCredentials: credentials).then((value) async {
      if (value["status"] == true) {
        saveAuthTokenAndUserID(authToken: value["token"], userID: value["userID"]);

        sessionCubit.emit(sessionCubit.state
            .copyWith(authCredentials: credentials, authenticatStatus: AuthenticatStatuses.Authenticated));
      }
      print(value)
      ;
      return value;
    });
  }

  Future<dynamic?> registerAppUser() async {
    //default-ageRange
    credentials = credentials.copyWith(preferredAgeRanges: getPreferredAgeRanges(int.parse(credentials.age!)));
    return await authService.registerPersonalUser(authCredentials: credentials).then((value) {
      print(value);
      if (value["status"] == true) {
        saveAuthTokenAndUserID(authToken: value["token"], userID: value["userID"]);
        showConnectionType();
      }
      return value;
    });
  }

  Future<dynamic?> registerSchoolUser() async {
    //default-ageRange
    credentials = credentials.copyWith(preferredAgeRanges: getPreferredAgeRanges(int.parse(credentials.age!)));
    return await authService.registerSchoolUser(authCredentials: credentials).then((value) {
      print(value);
      if (value["status"] == true) {
        saveAuthTokenAndUserID(authToken: value["token"], userID: value["userID"]);
        showSchoolConnectionType();
      }
      return value;
    });
  }

  Future<dynamic?> setVirtualConnectionType({required List<String> selectedVirtualConnectionTypeList}) async {
    return await authService
        .setVirtualConnectionType(
      selectedVirtualConnectionTypeList: selectedVirtualConnectionTypeList,
      token: sessionCubit.state.authToken!,
    )
        .then((value) {
      print(value);

      return value;
    });
  }

  Future<dynamic?> setFaceToFaceConnectionType({required List<String> selectedFaceToFaceConnectionTypeList}) async {
    return await authService
        .setFaceToFaceConnectionType(
      selectedFaceToFaceConnectionTypeList: selectedFaceToFaceConnectionTypeList,
      token: sessionCubit.state.authToken!,
    )
        .then((value) {
      print(value);

      return value;
    });
  }


  Future<dynamic> setCategories({required List<String> selectedCategoriesList}) async {
    return await authService
        .setCategories(
            selectedCategoriesList: selectedCategoriesList,
            token: sessionCubit.state.authToken!,
           )
        .then((value) {
      print(value);
      if (value["status"] == true) {
         showSchoolOutlinePage();
      }
      return value;
    });
  }


  Future<dynamic?> setBiographies({required String motto,  required String aboutMe}) async {
    return await authService
        .setBiographies(
       motto: motto, aboutMe:aboutMe,
      token: sessionCubit.state.authToken!,
    )
        .then((value) {
      print(value);
      if(value["status"] == true){
        sessionCubit.emit(sessionCubit.state.copyWith(authenticatStatus: AuthenticatStatuses.Authenticated));
      }

      return value;
    });
  }

  List<int> getPreferredAgeRanges(int age) {
    int minAge = age - 3;
    int maxAge = age + 3;

    if (minAge < 17) {
      minAge = 17;
    }
    return [minAge, maxAge];
  }

}
