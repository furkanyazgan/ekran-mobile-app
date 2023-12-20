import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClipBox extends StatelessWidget {
  CustomClipBox({Key? key, required this.child,this.color});
  Color? color;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color == null ? Colors.white : color,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child:  child,
      ),
    );
  }
}
