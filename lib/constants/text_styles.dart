import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();
  static const TextStyle buttonTextStyle = TextStyle(fontSize: 22, color: Colors.white);
  static  TextStyle getButtonTextStyle() => TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600, color: Colors.white);
  static  TextStyle getTitleTextStyle() => TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700, color: Colors.white);


}