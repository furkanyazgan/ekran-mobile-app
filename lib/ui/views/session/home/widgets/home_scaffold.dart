import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
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
            child: Padding(
              padding:   EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 15.0,
                      )
                    ],

                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
                height: 590.h,
                width: double.infinity,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:   EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 15.0,
                      )
                    ],

                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
                height: 590.h,
                width: double.infinity,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                    )
                  ],

                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
              height: 590.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Center(
                  child: bodyWidget == null ? SizedBox() : bodyWidget!,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
