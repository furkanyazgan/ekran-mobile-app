import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/categories_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionTypePage extends StatelessWidget {
  const ConnectionTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        showContinueButton: false,
        titleWidget: Text(
          "Connection Type",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            32.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Virtual",
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ),
            15.verticalSpace,
            CustomButton(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Connecting by category",
                        style: TextStyles.getButtonTextStyle(),
                      ),
                    )),
                height: 53.h,
                color: Color(0xff7acfd3),
                animationColor: Color(0xff21AFB5),
                borderRadius: 10.r,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CategoriesPage()));
                }),
            16.verticalSpace,
            CustomButton(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Connecting by category \n(Group)",
                        style: TextStyles.getButtonTextStyle(),
                      ),
                    )),
                height: 87.h,
                color: Color(0xff7acfd3),
                animationColor: Color(0xff21AFB5),
                borderRadius: 10.r,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CategoriesPage()));
                })
          ],
        ));
  }
}
