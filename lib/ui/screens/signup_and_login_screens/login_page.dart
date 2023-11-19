import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        showContinueButton: false,
        titleWidget: Text(
          "Log In",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
              ),
              child: Text(
                "Email:",
                style: TextStyle(fontSize: 24.sp, color: Color(0xff7e8086)),
              ),
            ),
            17.verticalSpace,
            SizedBox(
              height: 43.h,
              child: TextFormField(
                style: TextStyle(fontSize: 22.sp),
                decoration: InputDecoration(
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    fillColor: Color(0xfff5f5f5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
              ),
            ),
            17.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
              ),
              child: Text(
                "Password:",
                style: TextStyle(fontSize: 24.sp, color: Color(0xff7e8086)),
              ),
            ),
            17.verticalSpace,
            SizedBox(
              height: 43.h,
              child: TextFormField(
                style: TextStyle(fontSize: 22.sp),
                decoration: InputDecoration(
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    fillColor: Color(0xfff5f5f5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
              ),
            ),
            8.verticalSpace,
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9d8ffe)),
              ),
            ),
            Spacer(),
            Center(
              child: CustomButton(
                  child: Text(
                    "Start Connecting Now!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  width: 294.w,
                  height: 54.h,
                  color: Color(0xff20AFB5),
                  onTap: () {}),
            ),
            63.verticalSpace
          ],
        ));
  }
}
