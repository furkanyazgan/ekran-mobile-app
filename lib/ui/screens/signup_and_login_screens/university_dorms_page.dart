import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custom_rating_bar.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UniversityDormsPage extends StatelessWidget {
  const UniversityDormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
      showContinueButton: false,
        titleWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Are you residing in your university dorms?",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            78.verticalSpace,

            CustomButton(
                child: Row(
                  children: [
                    18.horizontalSpace,
                    Text(
                      "Yes",
                      style: TextStyles.getButtonTextStyle(),
                    ),
                    Spacer()
                  ],
                ),
                height: 53.h,
                color: Color(0xff7acfd3),
                animationColor: Color(0xff21AFB5),
                borderRadius: 10,
                onTap: () {}),
            22.verticalSpace,
            CustomButton(
                child: Row(
                  children: [
                    18.horizontalSpace,
                    Text(
                      "No",
                      style: TextStyles.getButtonTextStyle(),
                    ),
                    Spacer()
                  ],
                ),
                height: 53.h,
                color: Color(0xff7acfd3),
                animationColor: Color(0xff21AFB5),
                borderRadius: 10,
                onTap: () {}),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "or skip for now",
                  style: TextStyle(fontSize: 22.sp, color: Color(0xff9e9e9e)),
                )),
            74.verticalSpace
          ],
        ));
  }
}
