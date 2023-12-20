import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditTextFieldCard extends StatefulWidget {
  CustomEditTextFieldCard({Key? key, required this.title, required this.subTitle,  required   this.doneTap})
      : super(key: key);

  String title;
  String subTitle;
  Function(String)  doneTap;


  @override
  State<CustomEditTextFieldCard> createState() => _CustomEditTextFieldCardState();
}

class _CustomEditTextFieldCardState extends State<CustomEditTextFieldCard> {
  bool isEdit = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 34.w, right: 24.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  19.verticalSpace,
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  5.verticalSpace,
                  isEdit == true
                      ? SizedBox(
                          child: TextFormField(
                            onChanged: (value){
                              text = value;
                            },
                            initialValue: widget.subTitle,
                          ),
                          width: 200.w,
                        )
                      : Text(widget.subTitle, style: TextStyle(fontSize: 24, color: Colors.black45)),
                  5.verticalSpace
                ],
              ),
              Spacer(),
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                onPressed: () {

                  setState(() {
                    isEdit = !isEdit;

                    if(isEdit == false){
                      widget.doneTap(text);
                    }
                  });
                },
                iconSize: 33.w,
                icon: isEdit == false
                    ? Icon(
                        Icons.edit,
                        size: 33.w,
                      )
                    : Icon(
                        Icons.done,
                        size: 33.w,
                      ),
              ),
            ],
          ),
        )),
        width: double.infinity,
        height: 102.h,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black38, blurRadius: 5.0, offset: Offset(0, 2))],
          color: Colors.white,
        ));
  }
}
