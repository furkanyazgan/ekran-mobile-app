import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custom_rating_bar.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalityQuestionsPage extends StatelessWidget {
  const PersonalityQuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(

       showContinueButton: true,
        titleWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Personality Questions",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            28.verticalSpace,
            Text("I’m a social persion",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400, color: Colors.black54) ,),
            15.verticalSpace,
            SizedBox( height: 43.h,
              child: CutomRatingBar(onTap: (value){
                print(value);
              }),
            ),28.verticalSpace,
            Text("I like to spend time in nature",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400, color: Colors.black54) ,),
            15.verticalSpace,
            SizedBox( height: 43.h,
              child: CutomRatingBar(onTap: (value){
                print(value);
              }),
            ),28.verticalSpace,
            Text("I’m a risk-taker",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400, color: Colors.black54) ,),
            15.verticalSpace,
            SizedBox( height: 43.h,
              child: CutomRatingBar(onTap: (value){
                print(value);
              }),
            ),28.verticalSpace,
            Text("I enjoy conversations regarding politics and agenda",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400, color: Colors.black54) ,),
            15.verticalSpace,
            SizedBox( height: 43.h,
              child: CutomRatingBar(onTap: (value){
                print(value);
              }),
            ),





          ],
        ));
  }
}
