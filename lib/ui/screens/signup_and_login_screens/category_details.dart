import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//3<= popup uyarı

class CategoryDetailsPage extends StatefulWidget {
  CategoryDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  List<String> items = [
    "Exp 1",
    "Exp 2",
    "Exp 3",
    "Exp 4",
    "Exp 5",
  ];
  List<String> selectedValues = ["Example Text", "Example Text2"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(

        titleWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Category Details",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            63.verticalSpace,
            Text(
              "Example Title Text",
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            20.verticalSpace,
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
                    selectedValues.add(value!);
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
            ),
            15.verticalSpace,
            Wrap(

              runSpacing: 10,
              spacing: 10,
              children: selectedValues.map((item) {
                return InputChip(padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                  label: Text(
                    item,
                    style: TextStyle(color: Colors.white,fontSize: 16.sp),
                  ),
                  backgroundColor: Color(0xff20AFB5),
                  onDeleted: () {
                    setState(() {
                      selectedValues.remove(item);
                    });
                  },
                  deleteIconColor: Colors.white,
                );
              }).toList(),
            )
          ],
        ));
  }
}
