import 'package:ekran/ui/views/auth/signup/personal/personal_details_page.dart';
import 'package:ekran/ui/views/session/home/widgets/connention_card.dart';
import 'package:ekran/ui/views/session/home/widgets/personal_details_card.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSwiperListView extends StatefulWidget {
  const HorizontalSwiperListView({Key? key}) : super(key: key);

  @override
  State<HorizontalSwiperListView> createState() => _HorizontalSwiperListViewState();
}

class _HorizontalSwiperListViewState extends State<HorizontalSwiperListView> {
  final _controller = PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        ConnectionCard(),
        PersonalDetailsCard(
            hasImage: true, matchRate: 43, name: "name", age: 18, isOnline: true, city: "city", country: "country")
      ],
    );
  }
}
