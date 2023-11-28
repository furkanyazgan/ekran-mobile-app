import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMatchCard extends StatelessWidget {
  const CustomMatchCard({
    Key? key,
    required this.hasImage,
    required this.matchRate,
    required this.name,
    required this.age,
    required this.isSuccess,
  });
  final bool hasImage;
  final bool isSuccess;
  final int matchRate;
  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
      height: 300.w,
      width: 400.w,
      decoration: BoxDecoration(
        color: isSuccess
            ? themeProjectColors.boxColor
            : const Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            isSuccess ? 'Successful Connection' : 'Pending Connection',
            style: TextStyle(
              color: isSuccess ? Colors.white : themeProjectColors.mainColor,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: isSuccess ? Colors.white : themeProjectColors.mainColor,
              ),
              Text(
                '76% Match Rate',
                style: TextStyle(
                  color:
                  isSuccess ? Colors.white : themeProjectColors.mainColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 140,
                width: 140,
                child: hasImage
                    ? Image.asset(
                  AssetPath.userIcon,
                  color: themeProjectColors.backButtonColor,
                  width: 36.w,
                )
                    : Image.asset(
                  AssetPath.person,
                  width: 50.w,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: name,
                          style: TextStyle(
                            color: isSuccess
                                ? Colors.white
                                : themeProjectColors.mainColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                        TextSpan(
                          text: ', $age',
                          style: TextStyle(
                            color: isSuccess
                                ? Colors.white
                                : themeProjectColors.mainColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '1 km Away',
                    style: TextStyle(
                      color: isSuccess
                          ? Colors.white
                          : themeProjectColors.mainColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Common Categories:',
                      style: TextStyle(
                        color: isSuccess
                            ? Colors.white
                            : themeProjectColors.mainColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Text(
                          'Movies',
                          style: TextStyle(
                            color: isSuccess
                                ? Colors.white
                                : themeProjectColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Music',
                    style: TextStyle(
                      color: isSuccess
                          ? Colors.white
                          : themeProjectColors.mainColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: isSuccess
                        ? const Color.fromRGBO(108, 108, 108, 0.38)
                        : const Color.fromRGBO(230, 230, 230, 0.7),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.messenger_outline_rounded,
                        color: isSuccess ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Chat Now',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isSuccess ? Colors.white : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(108, 108, 108, 0.38),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.close,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Remove Connection',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isSuccess
                              ? Colors.white
                              : themeProjectColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}