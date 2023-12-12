
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';

class SchoolPasswordTextFormField extends StatelessWidget {
  SchoolPasswordTextFormField({Key? key}) : super(key: key);
//min 6 max32
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolPersonalDetailsBloc, SchoolPersonalDetailsState>(builder: (context, state) {
      return TextFormField(
        initialValue: state.password,
        onChanged: (value) {
          context.read<SchoolPersonalDetailsBloc>().add(SchoolPersonalDetailsPasswordChanged(password: value));
        },
        validator: (value) => state.isValidPassword ? null : "",
        style: TextStyle(fontSize: 18.sp),
        decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            fillColor: Color(0xffC8EBED),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5.r)))),
      );
    });
  }
}
