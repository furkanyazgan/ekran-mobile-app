import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_block.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_event.dart';
import 'package:ekran/core/controllers/auth/register/school_personal_details/school_personal_details_state.dart';

class SchoolFirstNameTextFormField extends StatelessWidget {
  SchoolFirstNameTextFormField({Key? key}) : super(key: key);

  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolPersonalDetailsBloc, SchoolPersonalDetailsState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: state.firstName,
              key: _formFieldKey,
              onChanged: (value) {
                context.read<SchoolPersonalDetailsBloc>().add(
                    SchoolPersonalDetailsFistNameChanged(firstName: value));
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



