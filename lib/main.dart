import 'package:ekran/app_navigator.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/register/register_block.dart';
import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/categories_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/category_description_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/category_details.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/connection_type_facetoface_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/connection_type_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/logic_questions.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/login_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personal_details_school_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/personality_questions_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/preferred_gender_connect_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/start_main_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_or_around.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegisterBloc()),
          BlocProvider(create: (context) => SessionCubit()),
          BlocProvider(create: (context) => AuthCubit())
        ],
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          builder: (_, child) {
            return MaterialApp(
              theme: ThemeData(
                      textTheme: Typography.englishLike2018
                          .apply(fontSizeFactor: 1.sp))
                  .copyWith(
                extensions: <ThemeExtension<dynamic>>[
                  ProjectTheme.light,
                ],
              ),
              debugShowCheckedModeBanner: false,
              home: child,
            );
          },
          child: AppNavigator(),
        ));
  }
}
