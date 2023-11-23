import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderDropDownButton extends StatefulWidget {
    GenderDropDownButton({Key? key}) : super(key: key);

  @override
  State<GenderDropDownButton> createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderDropDownButton> {
  final List<String> items = ["Male", "Female", "Other"];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDetailsBloc, PersonalDetailsState>(builder: (context, state) {
      return DropdownButtonHideUnderline(
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
            selectedValue = value;
            context
                .read<PersonalDetailsBloc>()
                .add(PersonalDetailsGenderChanged(gender: value));
            print("gender: ${state.gender}");
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: Colors.white),
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
      );
    });
  }
}
