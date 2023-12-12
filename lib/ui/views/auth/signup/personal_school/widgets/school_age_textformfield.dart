import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';

class SchoolAgeTextFormField extends StatelessWidget {
  SchoolAgeTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolPersonalDetailsBloc,SchoolPersonalDetailsState>(builder: (context, state) {

      return TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
      // for below version 2 use this
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly

          ],
      initialValue: state.age,
        onChanged: (value){
            print(value);
            print(value.runtimeType);
          context.read<SchoolPersonalDetailsBloc>().add(SchoolPersonalDetailsAgeChanged(age: value));
        },
        validator: (value) => state.isValidAge ? null : "",
        style: TextStyle(fontSize: 18.sp),
        decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
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
    });
  }
}