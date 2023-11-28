import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingsCard extends StatelessWidget {
  CustomSettingsCard({Key? key, required this.title, required this.subTitle, required this.onTap}) : super(key: key);

  String title;
  String subTitle;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 34.w, right: 24.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  12.verticalSpace,
                  Text(subTitle, style: TextStyle(fontSize: 24, color: Colors.black45))
                ],
              ),
              Spacer(),
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                onPressed: onTap,
                iconSize: 33.w,
                icon: Image.asset(
                  AssetPath.continueIcon,
                  color: themeProjectColors.mainColor,
                  width: 33.w,
                ),
              ),
            ],
          ),
        )),
        width: double.infinity,
        height: 102.h,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 5.0, offset: Offset(0, 2))],
          color: Colors.white,
        ));
  }
}
