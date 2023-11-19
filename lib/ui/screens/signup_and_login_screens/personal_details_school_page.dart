import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsSchoolPage extends StatefulWidget {
  const PersonalDetailsSchoolPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsSchoolPage> createState() => _PersonalDetailsSchoolPageState();
}

class _PersonalDetailsSchoolPageState extends State<PersonalDetailsSchoolPage> {
  final List<String> items = ["Male", "Female", "Other"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        titleWidget: Text(
          "Personal Details",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            42.verticalSpace,
            Text(
              "First Name",
              style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
            ),
            15.verticalSpace,
            SizedBox(
              height: 36.h,
              child: TextFormField(
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
              ),
            ),
            15.verticalSpace,
            Text(
              "Last Name",
              style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
            ),
            15.verticalSpace,
            SizedBox(
              height: 36.h,
              child: TextFormField(
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
              ),
            ),
            15.verticalSpace,
            Text(
              "School Email:",
              style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
            ),
            15.verticalSpace,
            SizedBox(
              height: 36.h,
              child: TextFormField(
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
              ),
            ),
            28.verticalSpace,
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Gender',
                  style: TextStyle(fontSize: 20.sp, color: Color(0xff928e9a)),
                  overflow: TextOverflow.ellipsis,
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black.withOpacity(0.75),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 48.h,
                  padding: EdgeInsets.only(right: 14.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Transform.rotate(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18.w,
                    ),
                    angle: -90 * pi / 180,
                  ),
                  openMenuIcon: Transform.rotate(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18.w,
                    ),
                    angle: 90 * pi / 180,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 1,
                  maxHeight: 200.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white),
                  offset: const Offset(0, -5),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(40.r),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                  padding: EdgeInsets.only(left: 14.w, right: 14.w),
                ),
              ),
            )
          ],
        ));
  }
}
