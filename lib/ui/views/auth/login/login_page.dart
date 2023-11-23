import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/login/login_bloc.dart';
import 'package:ekran/core/controllers/auth/login/login_event.dart';
import 'package:ekran/core/controllers/auth/login/login_state.dart';
import 'package:ekran/ui/views/auth/login/widgets/login_email_textformfield.dart';
import 'package:ekran/ui/views/auth/login/widgets/login_password_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/email_textformfield.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return BlocListener<LoginBloc, LoginState>(
        listenWhen: ((previous, current) => previous.formStatus != current.formStatus),
    listener: (context, state) {
      if (state.formStatus is SubmissionFailed) {
        _showSnackBar(context, "Email or password is incorrect");
      }


    },
      child: CustomScaffold(
          backButtonPress: () {
            context.read<AuthCubit>().showStartMainPage();
          },
          showContinueButton: false,
          titleWidget: Text(
            "Log In",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Text(
                  "Email:",
                  style: TextStyle(fontSize: 24.sp, color: Color(0xff7e8086)),
                ),
              ),
              17.verticalSpace,
              SizedBox(
                height: 43.h,
                child: LoginEmailTextFormField(),
              ),
              17.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Text(
                  "Password:",
                  style: TextStyle(fontSize: 24.sp, color: Color(0xff7e8086)),
                ),
              ),
              17.verticalSpace,
              SizedBox(
                height: 43.h,
                child: LoginPasswordTextFormField(),
              ),
              8.verticalSpace,
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xff9d8ffe)),
                ),
              ),
              Spacer(),
              Center(
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.formStatus is FormSubmitting
                        ? CircularProgressIndicator()
                        : CustomButton(
                            child: Text(
                              "Start Connecting Now!",
                              style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w700),
                            ),
                            width: 294.w,
                            height: 54.h,
                            color: Color(0xff20AFB5),
                            onTap: () {

                              context.read<LoginBloc>().add(LoginSubmitted());
                            });
                  },
                ),
              ),
              63.verticalSpace
            ],
          )),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


