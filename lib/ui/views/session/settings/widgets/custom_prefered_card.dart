import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPreferredCard extends StatelessWidget {
  const CustomPreferredCard({
    Key? key,
    required this.choose,
  });

  final String choose;

  @override
  Widget build(BuildContext context) {
    String title;
    String content;
    if (choose == 'One') {
      title = 'One To One Connection';
      content = 'We will match you with one person on campus, according to your preference.';
    } else if (choose == 'F2F') {
      title = 'F2F Group Connection';
      content = 'We will plan a meeting for you with a group of 4 people on campus, according to your preference.';
    } else if (choose == 'Virtual') {
      title = 'Virtual Group Connection';
      content = 'You will connect with 4 people in a group chat virtually.';
    } else {
      title = 'error';
      content = 'error';
    }
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
      height: 125.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: themeProjectColors.mainColor!.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.w,
              vertical: 10.0.h,
            ),
            child: Text(
              content,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
