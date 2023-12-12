import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/ui/views/session/chat/chat_navigator.dart';
import 'package:ekran/ui/views/session/home/home_navigator.dart';
import 'package:ekran/ui/views/session/location/location_navigator.dart';
import 'package:ekran/ui/views/session/connections/connections_navigator.dart';
import 'package:ekran/ui/views/session/settings/settings_navigator.dart';
import 'package:ekran/ui/widgets/custom_bottomm_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionPage extends StatefulWidget {
  SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {

  @override
  void initState() {
  context.read<SessionCubit>().getUserModelData();
    super.initState();
  }

  int currentIndex = 2;
  Widget currentPage = HomeNavigator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPage = _changePage(index);
            });
          },
        ),
        body: Center(
          child: currentPage,
        ));
  }
}

Widget _changePage(int index) {
  switch (index) {
    case 0:
      return LocationNavigator();
    case 1:
      return ConnectionsNavigator();
    case 2:
      return HomeNavigator();
    case 3:
      return ChatNavigator();
    case 4:
      return SettingsNavigator();
  }
  return HomeNavigator();
}
