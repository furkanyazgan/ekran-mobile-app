import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDescriptionPage extends StatelessWidget {
  CategoryDescriptionPage(
      {Key? key, required this.categoryText, required this.descriptionText})
      : super(key: key);
  String categoryText;
  String descriptionText;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        showContinueButton: false,
        titleWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Category Description",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            43.verticalSpace,
            Text(
              categoryText,
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            5.verticalSpace,
            Divider(
              color: Colors.black26,
            ),
            10.verticalSpace,
            RichText(
                text: TextSpan(
                    text: descriptionText,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)))
          ],
        ));
  }
}
