import 'dart:js';

import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_settings_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/settings_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      showBackButton: false,
      titleWidget: Text(
        "Edit Profile",
        style: TextStyle(fontSize: 30.sp, color: Colors.white),
      ),
      bodyWidget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 163.w,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  child: Text(
                    "SK",
                    style: TextStyle(fontSize: 44),
                  ),
                ),
              ),
            ),
            CustomSettingsCard(title: "Name", subTitle: "Saira Khan", onTap: () {}),
            CustomSettingsCard(title: "Email", subTitle: "saira@sabanciuniv.edu", onTap: () {}),
            CustomSettingsCard(title: "Change Categories", subTitle: "TV Series & Movies", onTap: () {}),
            CustomSettingsCard(title: "Location", subTitle: "Ankara, Turkey", onTap: () {}),
            CustomSettingsCard(title: "Password", subTitle: "*******", onTap: () {}),
            CustomSettingsCard(title: "Preferred Matching", subTitle: "One to One Matching", onTap: () {}),
            10.verticalSpace,
            CustomButton(
                child: Text(
                  "Log Out",
                  style: TextStyles.getButtonTextStyle(),
                ),
                color: Color(0xff20AFB5),
                height: 59.h,
                width: 294.w,
                onTap: () {

                  context.read<SessionCubit>().signOut();
                }),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
