import "package:ekran/constants/asset_paths.dart";
import "package:ekran/constants/project_themes.dart";
import "package:ekran/custom_library/custom_slidable_button_library/enum/slidable_button_position.dart";
import "package:ekran/custom_library/custom_slidable_button_library/horizontal_slidable_button.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomSlidableButton extends StatefulWidget {
  const CustomSlidableButton({Key? key}) : super(key: key);

  @override
  State<CustomSlidableButton> createState() => _CustomSlidableButtonState();
}

class _CustomSlidableButtonState extends State<CustomSlidableButton> {
  String result = "";
  late BoxDecoration _boxDecoration;

  @override
  void initState() {
    _boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          Colors.white,
          Color(0xffbfb8f2),


          Colors.white,
        ],
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;

    return HorizontalSlidableButton(
      centerPoint: true,
      initialPosition: SlidableButtonPosition.center,
      width: double.infinity,
      borderRadius: BorderRadius.zero,
      height: 82.h,
      buttonWidth: 66.0,
      color: Colors.red,
      dismissible: false,
      boxDecoration: _boxDecoration,
      label: Center(
          child: Container(
        width: 66.w,
        height: 66.h,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Image.asset(
            AssetPath.userIcon,
            color: themeProjectColors.mainColor,
          ),
        ),
      )),

      onTapDown: (value) {
        if (0.45 < value && value < 0.55) {
          print("düz$value");
          _boxDecoration = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Color(0xffbfb8f2),


                Colors.white,
              ],
            ),
          );
        } else {
          print("animasyon$value");
          _boxDecoration = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Color(0xffa0d6d8),
                Color(0xffecacad),
                Colors.white,
              ],
            ),
          );
        }
        setState(() {

        });
      },
      onChanged: (positionEnum) {
        setState(() {
          print(positionEnum);
          if (positionEnum == SlidableButtonPosition.end) {
            result = 'Button is at the right';
          } else {
            result = 'Button is on the left';
          }
        });
      },
    );
  }
}
