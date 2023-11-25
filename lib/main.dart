import 'package:ekran/app_navigator.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/auth/login/login_bloc.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';
import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/ui/views/auth/signup/personal/connection_type_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SessionCubit()),
          BlocProvider(create: (context) => AuthCubit(sessionCubit: context.read<SessionCubit>())),
          BlocProvider(create: (context) => PersonalDetailsBloc()),
          BlocProvider(create: (context) => LoginBloc(authCubit: context.read<AuthCubit>())),


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
          // child: AppNavigator(),
          child: AppNavigator(),
        ));
  }
}
