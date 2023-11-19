import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomRatingBar extends StatefulWidget  {
  CutomRatingBar(
      {required this.onTap});

  final Function(int) onTap;
  int selectIndex = -1;
  List<String> strList = ["1","2","3","4","5"];

  @override
  _CutomRatingBarState createState() => _CutomRatingBarState();
}

class _CutomRatingBarState extends State<CutomRatingBar>  {


  @override

  @override
  Widget build(BuildContext context) {
    List<Expanded> listWidget = [];
    for (int i = 0; i < widget.strList.length; i++) {
      listWidget.add(Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Material(borderRadius:BorderRadius.all(Radius.circular(3.r)),
            elevation: 8,
            child: InkWell(

              onTap:   () {
                setState(() {
                  widget.onTap(i);
                  widget.selectIndex = i;
                });
              },
              child: Container(
                child: Center(
                  child: Text(widget.strList[i],
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: widget.selectIndex == i
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF6650FD),
                      )),
                ),
                decoration: BoxDecoration(

                  color: widget.selectIndex == i
                      ? Color(0xFF20AFB5)
                      : Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.all(Radius.circular(3.r)),
                ),
              ),
            ),
          ),
        ),
      ));
    }

    return SizedBox(
      child: Center(
        child: Row(
          children: listWidget,
        ),
      ),


    );
  }
}