import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';

import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/ui/views/auth/login/widgets/login_email_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/circular_progress_indicator.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/email_textformfield.dart';

import 'package:ekran/ui/views/auth/signup/personal/widgets/first_name_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/gender_dropdown_button.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/last_name_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/password_textformfield.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return BlocListener<PersonalDetailsBloc, PersonalDetailsState>(
      listenWhen: ((previous, current) => previous.formStatus != current.formStatus),
      listener: (context, state) {
        if (state.formStatus is EmailDuplicateFailed) {
          _showSnackBar(context, "This email address is already used");
        }
        if (state.formStatus is FormValidationError) {
          _showSnackBar(context, "Please fill in the information completely");
        }
        if (state.formStatus is SubmissionSuccess) {
          context
              .read<AuthCubit>()
              .credentials = AuthCredentials(
              name: state.firstName,
              surname: state.lastName,
              email: state.email,
              age: "18",
              gender: state.gender,
              password: state.password);
          context.read<AuthCubit>().showPreferredGenderConnect();
        }
      },
      child: CustomScaffold(
        backButtonPress: () {
          context.read<AuthCubit>().showUniversityOrAroundPage();
        },
        titleWidget: Text(
          "Personal Details",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Text(
                "First Name",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: FirstNameTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Last Name",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: LastNameTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Email",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: EmailTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Password",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: PasswordTextFormField(),
              ),
              28.verticalSpace,
              GenderDropDownButton(),
              15.verticalSpace,
              CircularProgressIndicatorWidget(),
            ],
          ),
        ),
        continueButtonPress: () {
          if (_formValidate()) {
            context.read<PersonalDetailsBloc>().add(PersonalDetailsSubmitted());
          } else {
            context
                .read<PersonalDetailsBloc>()
                .add(PersonalDetailsFormStatusChanged(formStatus: FormValidationError()));
          }
        },
      ),
    );
  }

  bool _formValidate()  {

    return (context.read<PersonalDetailsBloc>().state.gender != "" && _formKey.currentState!.validate());
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
