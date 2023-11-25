import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferredGenderConnectPage extends StatelessWidget {
  const PreferredGenderConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
      showContinueButton: false,
      backButtonPress: () {
        print("back");
        context.read<AuthCubit>().showSignUpPersonal();
      },
      titleWidget: Text(
        "Preferred Gender \nTo Connect With",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          78.verticalSpace,
          CustomButton(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Male",
                        style: TextStyles.getButtonTextStyle(),
                      ),
                      Spacer()
                      // bu spacer text widgeti row içerisinde sola hizalamak için kullanıldı.
                    ],
                  )),
              height: 53.h,
              color: Color(0xff7acfd3),
              animationColor: Color(0xff21AFB5),
              borderRadius: 10.r,
              onTap: () async {
                context.read<AuthCubit>().credentials =
                    context.read<AuthCubit>().credentials.copyWith(preferredGender: "MALE");

                await context.read<AuthCubit>().registerNewUser().then((value) {
                  if (value["status"] == false) {
                    _showSnackBar(context, "An error occurred");
                  }
                });
              }),
          22.verticalSpace,
          CustomButton(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Female",
                        style: TextStyles.getButtonTextStyle(),
                      ),
                      Spacer()
                    ],
                  )),
              height: 53.h,
              color: Color(0xff7acfd3),
              animationColor: Color(0xff21AFB5),
              borderRadius: 10.r,
              onTap: () async {
                context.read<AuthCubit>().credentials =
                    context.read<AuthCubit>().credentials.copyWith(preferredGender: "FEMALE");

                await context.read<AuthCubit>().registerNewUser().then((value) {
                  if (value["status"] == false) {
                    _showSnackBar(context, "An error occurred");
                  }
                });
              }),
          22.verticalSpace,
          CustomButton(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Both",
                        style: TextStyles.getButtonTextStyle(),
                      ),
                      Spacer()
                    ],
                  )),
              height: 53.h,
              color: Color(0xff7acfd3),
              animationColor: Color(0xff21AFB5),
              borderRadius: 10.r,
              onTap: () async {
                context.read<AuthCubit>().credentials =
                    context.read<AuthCubit>().credentials.copyWith(preferredGender: "BOTH");

                await context.read<AuthCubit>().registerNewUser().then((value) {
                  if (value["status"] == false) {
                    _showSnackBar(context, "An error occurred");
                  }
                });
              }),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
