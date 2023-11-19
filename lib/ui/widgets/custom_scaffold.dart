import 'dart:math';

import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold(
      {Key? key,
      required this.titleWidget,
      required this.bodyWidget,
      this.showContinueButton = true,
      this.continueButtonPress,
      this.showBackButton = true})
      : super(key: key);

  Widget? titleWidget;
  Widget? bodyWidget;
  bool showContinueButton;
  VoidCallback? continueButtonPress;
  bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;

    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Stack(
        children: [
          Visibility(
            visible: showBackButton,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 75.h),
              child: Align(
                child: IconButton(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  iconSize: 33.w,
                  icon: Transform.rotate(
                    angle: 180 * pi / 180,
                    child: Image.asset(
                      AssetPath.continueIcon,
                      color: themeProjectColors.backButtonColor,
                      width: 33.w,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          Wrap(
            children: [
              Opacity(
                opacity: 0.25,
                child: Center(
                  child: Image.asset(
                    AssetPath.userIcon3,
                    height: 287.h,
                    fit: BoxFit.cover,
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                70.verticalSpace,
                Image.asset(
                  AssetPath.ekranLogo,
                  width: 129.h,
                ),
                Spacer(),
                titleWidget == null ? SizedBox() : titleWidget!,
                Spacer(),
                587.verticalSpace,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r))),
              height: 587.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Center(
                  child: bodyWidget == null ? SizedBox() : bodyWidget!,
                ),
              ),
            ),
          ),
          Visibility(
            visible: showContinueButton,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 38.w, bottom: 45.h),
                child: IconButton(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  onPressed: continueButtonPress,
                  iconSize: 33.w,
                  icon: Image.asset(
                    AssetPath.continueIcon,
                    color: themeProjectColors.mainColor,
                    width: 33.w,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
