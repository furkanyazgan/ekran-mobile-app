import 'package:ekran/core/controllers/auth/block_status.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';

class SchoolCircularProgressIndicatorWidget extends StatelessWidget {
  SchoolCircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolPersonalDetailsBloc, SchoolPersonalDetailsState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? Center(child: CircularProgressIndicator())
          : SizedBox();
    });
  }
}
