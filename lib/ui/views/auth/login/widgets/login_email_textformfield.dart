import 'package:ekran/core/controllers/auth/login/login_bloc.dart';
import 'package:ekran/core/controllers/auth/login/login_event.dart';
import 'package:ekran/core/controllers/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginEmailTextFormField extends StatelessWidget {
  const LoginEmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
      return TextFormField(
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginEmailChanged(email: value));
        },
        style: TextStyle(fontSize: 22.sp),
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            fillColor: Color(0xfff5f5f5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(10.r)))),
      );
    });
  }
}
