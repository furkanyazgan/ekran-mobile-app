import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/register/register_block.dart';
import 'package:ekran/core/controllers/auth/register/register_state.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/email_textformfield.dart';
import 'package:ekran/ui/views/auth/signup/personal/widgets/first_name_textformfield.dart';
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
  final List<String> items = ["Male", "Female", "Other"];
  String? selectedValue;
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
        titleWidget: Text(
          "Personal Details",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: BlocProvider(
          create: (context) => RegisterBloc(),
          child: BlocListener<RegisterBloc, RegisterState>(
            listenWhen: ((previous, current) =>
                previous.formStatus != current.formStatus),
            listener: ( context, state) {








            },
            child: Form(
              key: _formKey,
              child: Column(
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
                    child: FirstNameTextFormField(),
                  ),
                  15.verticalSpace,
                  Text(
                    "Last Name",
                    style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
                  ),
                  15.verticalSpace,
                  SizedBox(
                    height: 36.h,
                    child: LastNameTextFormField(),
                  ),
                  15.verticalSpace,
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
                  ),
                  15.verticalSpace,
                  SizedBox(
                    height: 36.h,
                    child: EmailTextFormField(),
                  ),
                  15.verticalSpace,
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
                  ),
                  15.verticalSpace,
                  SizedBox(
                    height: 36.h,
                    child: PasswordTextFormField(),
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
              ),
            ),
          ),
        ));
  }
}
