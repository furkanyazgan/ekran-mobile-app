import 'package:ekran/core/controllers/session/settings/settings_cubit.dart';
import 'package:ekran/core/controllers/session/settings/settings_state.dart';
import 'package:ekran/ui/views/session/settings/change_category_page.dart';
import 'package:ekran/ui/views/session/settings/edit_email_page.dart';
import 'package:ekran/ui/views/session/settings/edit_name_page.dart';
import 'package:ekran/ui/views/session/settings/edit_profile_page.dart';
import 'package:ekran/ui/views/session/settings/password_page.dart';
import 'package:ekran/ui/views/session/settings/preferred_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsNavigator extends StatelessWidget {
  const SettingsNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state.settingsPageStatuses == SettingsPageStatuses.EditProfile) MaterialPage(child: EditProfilePage()),
          if (state.settingsPageStatuses == SettingsPageStatuses.EditName) MaterialPage(child: EditNamePage()),
          if (state.settingsPageStatuses == SettingsPageStatuses.EditEmail) MaterialPage(child: EditEmailPage()),
          if (state.settingsPageStatuses == SettingsPageStatuses.ChangeCategories)
            MaterialPage(child: ChangeCategoryPage()),
          if (state.settingsPageStatuses == SettingsPageStatuses.Password) MaterialPage(child: PasswordPage()),
          if (state.settingsPageStatuses == SettingsPageStatuses.PreferredConnection)
            MaterialPage(child: PreferredConnecitonPage()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
