import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/ui/views/auth/login/login_page.dart';
import 'package:ekran/ui/views/auth/university_or_around.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartMainPage extends StatelessWidget {
  const StartMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Center(
        child: Stack(
          children: [
            Wrap(
              children: [
                Column(
                  children: [
                    115.verticalSpace,
                    Opacity(
                      opacity: 0.25,
                      child: Image.asset(
                        AssetPath.userIcon2,
                        fit: BoxFit.cover,
                        color: Color(0xFFF5F5F5),
                      ),
                    )
                  ],
                )
              ],
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  72.verticalSpace,
                  Image.asset(
                    AssetPath.ekranLogo,
                    width: 129.w,
                  ),
                  40.verticalSpace,
                  Text(
                    "Lets get started!",
                    style: TextStyle(fontSize: 32.sp, color: Colors.white),
                  ),
                  Spacer(),
                  CustomButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 28.sp),
                      ),
                      color: Color(0xff20AFB5),
                      width: 294.w,
                      height: 59.h,
                      onTap: () {
                        context.read<AuthCubit>().showUniversityOrAroundPage();
                      }),
                  20.verticalSpace,
                  TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().showLoginPage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            " Log In",
                            style: TextStyle(color: Color(0xffFFF73D)),
                          )
                        ],
                      )),
                  85.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
