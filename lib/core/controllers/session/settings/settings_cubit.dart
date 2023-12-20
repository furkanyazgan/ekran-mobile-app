

import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/controllers/session/settings/settings_state.dart';
import 'package:ekran/core/models/auth/school_user.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:ekran/core/services/session/settings/settings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SessionCubit sessionCubit;

  SettingsCubit({required this.sessionCubit})
      : super(SettingsState(settingsPageStatuses: SettingsPageStatuses.EditProfile)) {}
  final settingsService = SettingsService();

  void showEditProfile() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditProfile));

  void showEditName() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditName));

  void showEditEmail() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditEmail));

  void showChangeCategories() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.ChangeCategories));

  void showPassword() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.Password));

  void showPreferredConnection() =>
      emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.PreferredConnection));

  Future<dynamic?> setName({required String name}) async {
    SchoolUser temp = sessionCubit.state.schoolUser!;
    temp.name = name;
    sessionCubit.emit(sessionCubit.state.copyWith(schoolUser: temp));

    print("setname");
    await settingsService.putSchoolUser(body: temp.toJson(), token: sessionCubit.state.authToken!);
  }


  Future<dynamic?> setSurname({required String surname}) async {
    SchoolUser temp = sessionCubit.state.schoolUser!;
    temp.surname = surname;
    sessionCubit.emit(sessionCubit.state.copyWith(schoolUser: temp));

    print("surname");
    await settingsService.putSchoolUser(body: temp.toJson(), token: sessionCubit.state.authToken!);
  }

  Future<dynamic?> setEmail({required String email}) async {
    SchoolUser temp = sessionCubit.state.schoolUser!;
    temp.universityEmail = email;
     sessionCubit.emit(sessionCubit.state.copyWith(schoolUser: temp));
    print("surname");
    await settingsService.putSchoolUser(body: temp.toJson(), token: sessionCubit.state.authToken!);
  }

}
