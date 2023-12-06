import 'dart:js';

import 'package:ekran/core/controllers/session/settings/settings_cubit.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_category_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_edit_textfield_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/custom_settings_card.dart';
import 'package:ekran/ui/views/session/settings/widgets/settings_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeCategoryPage extends StatelessWidget {
  ChangeCategoryPage({Key? key}) : super(key: key);

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
          CustomCategoryCard(title: "Category 1", subTitle: "Movies and TV Series", onTap: () {}),
          CustomCategoryCard(title: "Category 2", subTitle: "Horoscopes", onTap: () {}),
          CustomCategoryCard(title: "Category 3", subTitle: "Unlock Now!", isLock: true, onTap: () {}),
          CustomCategoryCard(title: "Category 4", subTitle: "Unlock Now!", isLock: true, onTap: () {}),
          CustomCategoryCard(title: "Category 5", subTitle: "Unlock Now!", isLock: true, onTap: () {}),
        ],
      ),
    );
  }
}
