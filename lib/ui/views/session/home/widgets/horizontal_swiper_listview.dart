import 'package:ekran/core/services/test/test_service.dart';
import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/views/session/home/widgets/connention_card.dart';
import 'package:ekran/ui/views/session/home/widgets/custom_slidable_button.dart';
import 'package:ekran/ui/views/session/home/widgets/personal_details_card.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSwiperListView extends StatefulWidget {
  HorizontalSwiperListView({Key? key, required this.connectionModel}) : super(key: key);
  ConnectionModel connectionModel;

  @override
  State<HorizontalSwiperListView> createState() => _HorizontalSwiperListViewState();
}

class _HorizontalSwiperListViewState extends State<HorizontalSwiperListView> {
  final _controller = PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(25.r))),
      height: 590.h,
      width: 393.w,
      child: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  ConnectionCard(
                    connectionModel: widget.connectionModel,
                  ),
                  PersonalDetailsCard(
                      hasImage: true,
                      matchRate: 43,
                      name: "name",
                      age: 18,
                      isOnline: true,
                      city: "city",
                      country: "country")
                ],
              ),
            ),
            CustomSlidableButton()
            ,30.verticalSpace
          ],
        ),
      ),
    );
  }
}
