import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryCard extends StatefulWidget {
  CustomCategoryCard({Key? key,  this.isLock = false, required this.title, required this.subTitle, required this.onTap}) : super(key: key);

  String title;
  String subTitle;
  VoidCallback onTap;
  bool isLock ;

  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {


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
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  12.verticalSpace,
                  Text(widget.subTitle, style: TextStyle(fontSize: 24, color: Colors.black45))
                ],
              ),
              Spacer(),
              widget.isLock == true
                  ? IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: widget.onTap,
                      iconSize: 33.w,
                      icon: Icon(Icons.lock),
                    )
                  : IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: widget.onTap,
                      iconSize: 33.w,
                      icon: Icon(Icons.edit),
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
