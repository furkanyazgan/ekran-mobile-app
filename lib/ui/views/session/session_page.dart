import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:ekran/ui/widgets/custom_bottomm_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionPage extends StatefulWidget {
  SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(onTap: (index){
          print(index);
        },),
        body: Center(
          child: Column(
            children: [
              const Text("oturum açıldı"),
              ElevatedButton(
                  onPressed: () {
                    context.read<SessionCubit>().signOut();
                  },
                  child: const Text("SignOut"))
            ],
          ),
        ));
  }
}
