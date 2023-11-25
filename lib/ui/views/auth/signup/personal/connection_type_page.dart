import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/models/enums/matching/connectionTypes/virtual_connection_type.dart';
import 'package:ekran/ui/views/auth/signup/personal/categories_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionTypePage extends StatelessWidget {
  ConnectionTypePage({Key? key}) : super(key: key);

  List<String> selectedVirtualConnectionTypeList = [];

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
      showBackButton: false,
      showContinueButton: true,
      titleWidget: Text(
        "Connection Type",
        textAlign: TextAlign.center,
        style: TextStyles.getTitleTextStyle(),
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          32.verticalSpace,
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
                      style: TextStyles.getButtonTextStyle(),
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
                      style: TextStyles.getButtonTextStyle(),
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
              })
        ],
      ),

      continueButtonPress: () {
        context
            .read<AuthCubit>()
            .setVirtualConnectionType(selectedVirtualConnectionTypeList: selectedVirtualConnectionTypeList).then((value) {
           if(value["status"] == false){
             _showSnackBar(context, "An error occurred");
           }
        });
      },

    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
