import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/models/enums/matching/connectionTypes/facetoface_connection_type.dart';
import 'package:ekran/core/models/enums/matching/connectionTypes/virtual_connection_type.dart';
import 'package:ekran/ui/views/auth/signup/personal/categories_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/views/auth/signup/personal_school/personal_details_school_page.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolConnectionTypePage extends StatelessWidget {
  SchoolConnectionTypePage({Key? key}) : super(key: key);
  List<String> selectedVirtualConnectionTypeList = [];
  List<String> selectedFaceToFaceConnectionTypeList = [];

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
      showContinueButton: true,
      titleWidget: Text(
        "Connection Type",
        textAlign: TextAlign.center,
        style: TextStyles.getTitleTextStyle(),
      ),
      bodyWidget: Padding(
        padding: EdgeInsets.only(top: 32),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 450.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Virtual",
                      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ),
                  15.verticalSpace,
                  CustomRadioButton(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Connecting by category",
                              style: TextStyles.getConnectionTypeHeaderTextStyle(),
                            ),
                          )),
                      height: 53.h,
                      selectedColor: Color(0xff21AFB5),
                      unSelectedColor: Color(0xff7acfd3),
                      borderRadius: 10.r,
                      value: VirtualConnectionType.DUO_BY_CATEGORY.name,
                      onTap: (value, isSelected) {
                        if (isSelected) {
                          selectedVirtualConnectionTypeList.add(value);
                        } else {
                          selectedVirtualConnectionTypeList.remove(value);
                        }
                        print(selectedVirtualConnectionTypeList);
                      }),
                  16.verticalSpace,
                  CustomRadioButton(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Connecting by category \n(Group)",
                              style: TextStyles.getConnectionTypeHeaderTextStyle(),
                            ),
                          )),
                      height: 87.h,
                      selectedColor: Color(0xff21AFB5),
                      unSelectedColor: Color(0xff7acfd3),
                      borderRadius: 10.r,
                      value: VirtualConnectionType.GROUP_BY_CATEGORY.name,
                      onTap: (value, isSelected) {
                        if (isSelected) {
                          selectedVirtualConnectionTypeList.add(value);
                        } else {
                          selectedVirtualConnectionTypeList.remove(value);
                        }
                        print(selectedVirtualConnectionTypeList);
                      }),
                  15.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Face to Face",
                      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.black54),
                    ),
                  ),
                  10.verticalSpace,
                  CustomRadioButton(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Group meetup (4 categories)",
                                  style: TextStyles.getConnectionTypeHeaderTextStyle(),
                                ),
                              ),
                              5.verticalSpace,
                              RichText(
                                  text: TextSpan(
                                      text:
                                          "We will arrange a meeting for a group of 4 people on campus based on your preference.",
                                      style:
                                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.white)))
                            ],
                          )),
                      height: 135.h,
                      selectedColor: Color(0xff21AFB5),
                      unSelectedColor: Color(0xff7acfd3),
                      borderRadius: 10.r,
                      value: FaceToFaceConnectionType.GROUP_MEETUP.name,
                      onTap: (value, isSelected) {
                        if (isSelected) {
                          selectedFaceToFaceConnectionTypeList.add(value);
                        } else {
                          selectedFaceToFaceConnectionTypeList.remove(value);
                        }
                        print(selectedFaceToFaceConnectionTypeList);
                      }),
                  22.verticalSpace,
                  CustomRadioButton(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Duo meetup (4 categories)",
                                  style: TextStyles.getConnectionTypeHeaderTextStyle(),
                                ),
                              ),
                              7.verticalSpace,
                              RichText(
                                  text: TextSpan(
                                      text:
                                          "We will arrange a meeting with one person on campus based on your preference.",
                                      style:
                                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.white)))
                            ],
                          )),
                      height: 124.h,
                      selectedColor: Color(0xff21AFB5),
                      unSelectedColor: Color(0xff7acfd3),
                      borderRadius: 10.r,
                      value: FaceToFaceConnectionType.DUO_MEETUP.name,
                      onTap: (value, isSelected) {
                        if (isSelected) {
                          selectedFaceToFaceConnectionTypeList.add(value);
                        } else {
                          selectedFaceToFaceConnectionTypeList.remove(value);
                        }
                        print(selectedFaceToFaceConnectionTypeList);
                      }),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
      continueButtonPress: () async{
       var t1 = await context.read<AuthCubit>().setVirtualConnectionType(selectedVirtualConnectionTypeList: selectedVirtualConnectionTypeList);
       var t2 = await  context.read<AuthCubit>().setFaceToFaceConnectionType(selectedFaceToFaceConnectionTypeList: selectedFaceToFaceConnectionTypeList);
       if(t1["status"] && t2["status"]){
         context.read<AuthCubit>().showCategoriesPage();
       }else{
         _showSnackBar(context, "An error occurred");
       }


      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
