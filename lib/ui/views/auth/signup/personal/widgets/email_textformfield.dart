import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextFormField extends StatelessWidget {
  EmailTextFormField({Key? key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDetailsBloc, PersonalDetailsState>(builder: (context, state) {
      return TextFormField(
        initialValue: state.email,

        onChanged: (value) {

          context.read<PersonalDetailsBloc>().add(PersonalDetailsEmailChanged(email: value));

        },
        validator: (value) => state.isValidEmail ? null : "",
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
