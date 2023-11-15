import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/screens/signup_and_login_screens/categories_page.dart';
import 'package:ekran/screens/signup_and_login_screens/login_page.dart';
import 'package:ekran/screens/signup_and_login_screens/personal_details_page.dart';
import 'package:ekran/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/screens/signup_and_login_screens/preferred_gender_connect_page.dart';
import 'package:ekran/screens/signup_and_login_screens/start_main_page.dart';
import 'package:ekran/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/screens/signup_and_login_screens/university_or_around.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Lato-FontFamily").copyWith(
        extensions: <ThemeExtension<dynamic>>[
          ProjectTheme.light,
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: CategoriesPage(),
    );
  }
}
