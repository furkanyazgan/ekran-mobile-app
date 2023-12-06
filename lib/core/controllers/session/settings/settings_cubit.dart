import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/controllers/session/settings/settings_state.dart';
import 'package:ekran/core/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(settingsPageStatuses: SettingsPageStatuses.EditProfile)) {}

  void showEditProfile() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditProfile));

  void showEditName() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditName));
  void showEditEmail() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.EditEmail));
  void showChangeCategories() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.ChangeCategories));
  void showPassword() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.Password));
  void showPreferredConnection() => emit(state.copyWith(settingsPageStatuses: SettingsPageStatuses.PreferredConnection));
}
