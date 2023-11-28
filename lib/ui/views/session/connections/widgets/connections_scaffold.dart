import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionsScaffold extends StatefulWidget {
  ConnectionsScaffold({Key? key, required this.bodyWidget, required this.titleWidget}) : super(key: key);
  Widget? bodyWidget;
  Widget? titleWidget;

  @override
  State<ConnectionsScaffold> createState() => _ConnectionsScaffoldState();
}

class _ConnectionsScaffoldState extends State<ConnectionsScaffold> {
  String selectedButton = "SUCCESSFUL";

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 263.h,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 14.h),
                  child: widget.bodyWidget ?? SizedBox(),
                ),
                color: Colors.white,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 263.h,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        18.horizontalSpace,
                        CustomRadioButton(
                            selectedButton: selectedButton == "SUCCESSFUL" ? true : false,
                            value: "SUCCESSFUL",
                            child: Text(
                              "Successful",
                              style: TextStyle(color: selectedButton == "SUCCESSFUL" ? Colors.white : Colors.black),
                            ),
                            width: 140.w,
                            height: 36.h,
                            selectedColor: themeProjectColors.mainColor!,
                            unSelectedColor: Color(0xffefefef),
                            onTap: (value, isSelected) {
                              setState(() {
                                selectedButton = value;
                              });
                            }),
                        Spacer(),
                        CustomRadioButton(
                            selectedButton: selectedButton == "PENDING" ? true : false,
                            value: "PENDING",
                            child: Text(
                              "Pending",
                              style: TextStyle(color: selectedButton == "PENDING" ? Colors.white : Colors.black),
                            ),
                            width: 140.w,
                            height: 36.h,
                            selectedColor: themeProjectColors.mainColor!,
                            unSelectedColor: Color(0xffefefef),
                            onTap: (value, isSelected) {
                              setState(() {
                                selectedButton = value;
                              });
                            }),
                        18.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: themeProjectColors.mainColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r))),
              height: 193.h,
              width: double.infinity,
              child: Center(
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
                    Text(
                      "Past Connections",
                      style: TextStyles.getTitleTextStyle(),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
