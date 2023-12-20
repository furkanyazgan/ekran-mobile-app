import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/core/controllers/session/settings/settings_cubit.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_edit_textfield_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_settings_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/settings_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditNamePage extends StatelessWidget {
  EditNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return SettingsScaffold(
        showBackButton: true,
        backButtonPress: () {
          context.read<SettingsCubit>().showEditProfile();
        },
        titleWidget: Text(
          "Edit Name",
          style: TextStyle(fontSize: 30.sp, color: Colors.white),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomEditTextFieldCard(
                title: "First Name",
                subTitle: state.schoolUser  == null ? ""  :  state.schoolUser!.name!,
                doneTap: (text) {
                  context.read<SettingsCubit>().setName(name: text);
                }),
            CustomEditTextFieldCard(
                title: "Last Name",
                subTitle: state.schoolUser  == null ? ""  :  state.schoolUser!.surname!,
                doneTap: (text) {
                  context.read<SettingsCubit>().setSurname(surname: text);
                }),
          ],
        ),
      );
    });
  }
}
