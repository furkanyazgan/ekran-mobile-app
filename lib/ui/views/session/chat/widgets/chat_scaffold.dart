import 'dart:math';

import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScaffold extends StatelessWidget {
  ChatScaffold(
      {Key? key, required this.bodyWidget, required this.titleWidget, this.backButtonPress, this.showBackButton = true})
      : super(key: key);
  Widget? bodyWidget;
  Widget? titleWidget;
  bool showBackButton;
  VoidCallback? backButtonPress;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(backgroundColor: themeProjectColors.mainColor,
      body: Stack(
        children: [
          Container(
            height: 169.h,
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
          Padding(
            padding: EdgeInsets.only(top: 169.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: bodyWidget == null ? SizedBox() : bodyWidget!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
