import 'package:ekran/core/controllers/auth/block_status.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/personal_details/personal_details_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstNameTextFormField extends StatelessWidget {
  FirstNameTextFormField({Key? key}) : super(key: key);

  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDetailsBloc, PersonalDetailsState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
            child: TextFormField(
  initialValue: state.firstName,
              key: _formFieldKey,
              onChanged: (value) {
                context.read<PersonalDetailsBloc>().add(
                    PersonalDetailsFistNameChanged(firstName: value));
              },

              validator: (value) =>
              state.isValidFirstName
                  ? null
                  : "",
              style: TextStyle(fontSize: 18.sp),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0),

                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  fillColor: Color(0xffC8EBED),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(5.r)))),
            ),
          ),
        ],
      );
    });
  }

  Widget buildErrorWidget() {

   if( _formFieldKey.currentState != null){
     print("adasd");
     print(_formFieldKey.currentState!.validate());
   }
    return SizedBox();
  }


}



