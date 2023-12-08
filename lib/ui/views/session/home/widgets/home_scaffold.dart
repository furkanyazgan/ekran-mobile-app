import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScaffold extends StatelessWidget {
  HomeScaffold({Key? key, required this.bodyWidget, required this.titleWidget}) : super(key: key);
  Widget? bodyWidget;
  Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Stack(
        children: [
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
                610.verticalSpace,

              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(

              height: 615.h,
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
