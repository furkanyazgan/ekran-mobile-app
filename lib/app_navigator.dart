import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/core/controllers/session/session_state.dart';
import 'package:ekran/ui/views/auth/auth_navigator.dart';
import 'package:ekran/ui/views/session/session_page.dart';
import 'package:ekran/ui/views/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state.authenticatStatus == AuthenticatStatuses.UnknownSessionState) MaterialPage(child: SplashPage()),
          if (state.authenticatStatus == AuthenticatStatuses.Unauthenticated) MaterialPage(child: AuthNavigator()),
          if (state.authenticatStatus == AuthenticatStatuses.Authenticated) MaterialPage(child: SessionPage()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
