import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';
import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_age_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_circular_progress_indicator.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_email_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_first_name_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_gender_dropdown_button.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_last_name_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/widgets/school_password_textformfield.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolPersonalDetailsPage extends StatefulWidget {
  const SchoolPersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<SchoolPersonalDetailsPage> createState() => _SchoolPersonalDetailsPageState();
}

class _SchoolPersonalDetailsPageState extends State<SchoolPersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return BlocListener<SchoolPersonalDetailsBloc, SchoolPersonalDetailsState>(
      listenWhen: ((previous, current) => previous.formStatus != current.formStatus),
      listener: (context, state) {
        if (state.formStatus is EmailDuplicateFailed) {
          _showSnackBar(context, "This email address is already used");
        }
        if (state.formStatus is FormValidationError) {
          _showSnackBar(context, "Please fill in the information completely");
        }
        if (state.formStatus is SubmissionSuccess) {
          context.read<AuthCubit>().credentials = AuthCredentials(
              name: state.firstName,
              surname: state.lastName,
              email: state.email,
              age: "18",
              gender: state.gender,
              password: state.password);
          context.read<AuthCubit>().showSchoolPreferredGenderConnect();
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
                child: SchoolFirstNameTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Last Name",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: SchoolLastNameTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "School Email",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: SchoolEmailTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Password",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              SizedBox(
                height: 36.h,
                child: SchoolPasswordTextFormField(),
              ),
              15.verticalSpace,
              Text(
                "Age",
                style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36.h,
                      child: SchoolAgeTextFormField(),
                    ),
                  ),
                  25.horizontalSpace,
                  Expanded(child: SchoolGenderDropDownButton()),
                ],
              ),
              15.verticalSpace,
              SchoolCircularProgressIndicatorWidget(),
            ],
          ),
        ),
        continueButtonPress: () {
          if (_formValidate()) {
            context.read<SchoolPersonalDetailsBloc>().add(SchoolPersonalDetailsSubmitted());
          } else {
            context
                .read<SchoolPersonalDetailsBloc>()
                .add(SchoolPersonalDetailsFormStatusChanged(formStatus: FormValidationError()));
          }
        },
      ),
    );
  }

  bool _formValidate() {
    return (context.read<SchoolPersonalDetailsBloc>().state.gender != "" && _formKey.currentState!.validate());
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
