import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogicQuestionsPage extends StatefulWidget {
  LogicQuestionsPage({Key? key}) : super(key: key);

  @override
  State<LogicQuestionsPage> createState() => _LogicQuestionsPageState();
}

class _LogicQuestionsPageState extends State<LogicQuestionsPage> {

  Map<String, String?> questionsMap = {
    "Waste them": "A",
    "Invest them": "B",
    "Buy gifts for people": "C",
    "Other": "D",
  };

  String selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(

        titleWidget: Text(
          "Logic\nQuestions",
          textAlign: TextAlign.center,
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            48.verticalSpace,
            RichText(
                text: TextSpan(
                    text:
                        "What would you do if you had a million dollars right now?",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54))),
            25.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: questionsMap.length,
                  itemBuilder: (_, index) {
                    return Column(children: [
                      CustomRadioButton(borderRadius: 10.r,
                      selectedButton: selectedAnswer == questionsMap.values.elementAt(index).toString() ? true : false,

                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text(
                            questionsMap.keys.elementAt(index).toString(),
                            style: TextStyles.getButtonTextStyle(),
                          ),
                        ),
                      ),
                      height: 46.h,
                      onTap: (value) {
                        setState(() {
                          selectedAnswer = value;
                          print(value);
                        });
                      },
                      value: questionsMap.values.elementAt(index).toString(),
                      selectedColor: Color(0xff20AFB5),
                      unSelectedColor: Color(0xff7acfd3),),17.verticalSpace
                    ],);

                  }),
            )
          ],
        ));
  }
}
