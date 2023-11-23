import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';

import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CircularProgressIndicatorWidget extends StatelessWidget {
  CircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDetailsBloc, PersonalDetailsState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? Center(child: CircularProgressIndicator())
          : SizedBox();
    });
  }
}
