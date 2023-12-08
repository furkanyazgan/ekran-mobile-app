import 'package:ekran/core/controllers/session/settings/settings_cubit.dart';
import 'package:ekran/ui/views/session/settings/widgets/settings_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectingSettings extends StatefulWidget {
  ConnectingSettings({Key? key}) : super(key: key);

  @override
  State<ConnectingSettings> createState() => _ConnectingSettingsState();
}

class _ConnectingSettingsState extends State<ConnectingSettings> {
  int _lowerValue = 18;
  int _upperValue = 50;

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      showBackButton: false,
      backButtonPress: () {
        context.read<SettingsCubit>().showEditProfile();
      },
      titleWidget: Text(
        "Connecting Settings",
        style: TextStyle(fontSize: 30.sp, color: Colors.white),
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 34.w, right: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Age Range",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Spacer(),
                        Text("$_lowerValue-$_upperValue"),
                      ],
                    ),
                    RangeSlider(
                      min: 13,
                      max: 55,
                      values: RangeValues(_lowerValue.toDouble(), _upperValue.toDouble()),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _lowerValue = values.start.round();
                          _upperValue = values.end.round();
                          if (_lowerValue <= 18) {
                            _lowerValue = 18;
                          }
                          if (_upperValue >= 50) {
                            _upperValue = 50;
                          }
                        });
                      },
                    )
                  ],
                ),
              )),
              width: double.infinity,
              height: 102.h,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 5.0, offset: Offset(0, 2))],
                color: Colors.white,
              )),
          Container(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 34.w, right: 24.w),
                child: Row(
                  children: [
                    Text(
                      "Preferred Gender to Connect",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Spacer(),
                    IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 17.w,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              )),
              width: double.infinity,
              height: 102.h,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 5.0, offset: Offset(0, 2))],
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
