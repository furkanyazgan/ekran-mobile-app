import 'dart:js';

import 'package:ekran/core/controllers/session/settings/settings_cubit.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_edit_textfield_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_prefered_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_settings_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/settings_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferredConnecitonPage extends StatelessWidget {
  PreferredConnecitonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          20.verticalSpace,
          CustomPreferredCard(choose: "One"),
          20.verticalSpace,
          CustomPreferredCard(choose: "F2F"),
          20.verticalSpace,
          CustomPreferredCard(choose: "Virtual"),
          20.verticalSpace,
          CustomPreferredCard(choose: "Virtual"),
        ],
      ),
    );
  }
}
