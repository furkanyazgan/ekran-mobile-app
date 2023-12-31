import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/personal_details_school_page.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UniversityOrAroundPage extends StatelessWidget {
  const UniversityOrAroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return CustomScaffold(
          backButtonPress: () {
            context.read<AuthCubit>().showStartMainPage();
          },
          showContinueButton: false,
          titleWidget: Text(
            "Uni - Uni / Normal Connection",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.verticalSpace,
              CustomButton(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "To connect with people within my university",
                        style: TextStyles.getButtonTextStyle(),
                      )),
                  height: 87.h,
                  color: Color(0xff7acfd3),
                  animationColor: Color(0xff21AFB5),
                  borderRadius: 10.r,
                  onTap: () {
                    context.read<AuthCubit>().showSchoolPersonalDetailsPage();
                  }),
              25.verticalSpace,
              CustomButton(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "To connect with people around me",
                        style: TextStyles.getButtonTextStyle(),
                      )),
                  height: 87.h,
                  color: Color(0xff7acfd3),
                  animationColor: Color(0xff21AFB5),
                  borderRadius: 10.r,
                  onTap: () {
                    context.read<AuthCubit>().showPersonalDetailsPage();
                  })
            ],
          ));
    });
  }
}
