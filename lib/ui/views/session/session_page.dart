import 'package:ekran/core/controllers/session/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [

        Text("oturum açıldı"),
        ElevatedButton(onPressed: (){
          context.read<SessionCubit>().signOut();


        }, child: Text("SignOut"))
      ],),
    ));
  }
}
