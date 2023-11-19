import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/categories_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/category_description_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/connection_type_facetoface_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/connection_type_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/login_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personality_questions_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/preferred_gender_connect_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/start_main_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_or_around.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,

      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp)
          ).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              ProjectTheme.light,
            ],
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: PersonalityQuestionsPage(),
    );
  }
}
