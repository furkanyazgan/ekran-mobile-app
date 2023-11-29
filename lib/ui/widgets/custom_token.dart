import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToken extends StatelessWidget {
  const CustomToken({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
      height: 250.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: themeProjectColors.boxColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 40.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30.0),
                child: Text(
                  'Get more Token now!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 75.h,
            width: 75.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: themeProjectColors.boxColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetPath.userIcon,
                    color: Colors.white,
                    width: 24.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  child: Text(
                    'Continue to payment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  height: 40.h,
                  width: 140.w,
                  onTap: () {},
                ),
                CustomButton(
                  child: Text(
                    'or watch video',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  height: 40.h,
                  width: 140.w,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
