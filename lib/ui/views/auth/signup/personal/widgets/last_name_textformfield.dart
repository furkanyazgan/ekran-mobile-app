import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastNameTextFormField extends StatelessWidget {
  LastNameTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 18.sp),
      decoration: InputDecoration(
          filled: true,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          fillColor: Color(0xffC8EBED),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5.r)))),
    );
  }
}