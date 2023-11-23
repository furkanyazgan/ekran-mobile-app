import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/ui/views/auth/login/login_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/connection_type_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/preferred_gender_connect_page.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/views/auth/start_main_page.dart';
import 'package:ekran/ui/views/auth/university_or_around.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if(state == AuthState.startMain)MaterialPage(child: StartMainPage()),
          if(state == AuthState.universityOrAround)MaterialPage(child: UniversityOrAroundPage()),
          if(state == AuthState.login)MaterialPage(child: LoginPage()),

          if (state == AuthState.signUpPersonal) MaterialPage(child: PersonalDetailsPage()),
          if (state == AuthState.preferredGenderConnect) MaterialPage(child: PreferredGenderConnectPage()),
          if (state == AuthState.connectionType) MaterialPage(child: ConnectionTypePage()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
