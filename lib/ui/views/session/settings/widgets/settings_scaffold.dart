import 'dart:math';

import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScaffold extends StatelessWidget {
  SettingsScaffold(
      {Key? key, required this.bodyWidget, required this.titleWidget, this.backButtonPress, this.showBackButton = true})
      : super(key: key);
  Widget? bodyWidget;
  Widget? titleWidget;
  bool showBackButton;
  VoidCallback? backButtonPress;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top:128.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: bodyWidget == null ? SizedBox() : bodyWidget!,
              ),
            ),
          ),
          Material(
            elevation: 8,
            child: Container(
              height: 128.h,
              width: double.infinity,
              color: themeProjectColors.mainColor,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Row(
                    children: [
                      15.horizontalSpace,
                      showBackButton
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: backButtonPress,
                              iconSize: 33.w,
                              icon: Transform.rotate(
                                angle: 180 * pi / 180,
                                child: Image.asset(
                                  AssetPath.continueIcon,
                                  color: Colors.white,
                                  width: 27.w,
                                ),
                              ),
                            )
                          : SizedBox(),
                      10.horizontalSpace,
                      titleWidget == null ? SizedBox() : titleWidget!,
                    ],
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
