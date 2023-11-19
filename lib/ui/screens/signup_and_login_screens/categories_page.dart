import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<String> categoriesList = [
    "Photographs",
    "Music",
    "Horoscope",
    "Personality Questions",
    "Movies and TV Series",
    "Hobbies",
    "Logic Question",
  ];

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        titleWidget: Column(
          children: [
            Text(
              "Preferred Categories",
              textAlign: TextAlign.center,
              style: TextStyles.getTitleTextStyle(),
            ),
            3.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "You must choose at-least ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text: "2 ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFF73D)),
                    ),
                    TextSpan(
                      text: "categories for  virtual matching and at-least ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text: "4  ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFF73D)),
                    ),
                    TextSpan(
                      text: "categories for face to face",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bodyWidget: Column(
          children: [
            40.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomButton(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                children: [
                                  Text(
                                    categoriesList[index].toString(),
                                    style: TextStyles.getButtonTextStyle(),
                                  ),
                                  Spacer()
                                ],
                              )),
                          height: 53.h,
                          color: Color(0xff7acfd3),
                          animationColor: Color(0xff21AFB5),
                          borderRadius: 10.r,
                          onTap: () {}),
                      19.verticalSpace
                    ],
                  );
                },
                itemCount: categoriesList.length,
              ),
            ),
            116.verticalSpace
          ],
        ));
  }
}
