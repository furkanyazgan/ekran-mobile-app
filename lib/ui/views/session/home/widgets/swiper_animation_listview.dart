import 'package:card_swiper/card_swiper.dart';
import 'package:ekran/ui/views/session/home/widgets/horizontal_swiper_listview.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperAnimationListView extends StatefulWidget {
  const SwiperAnimationListView({Key? key}) : super(key: key);

  @override
  State<SwiperAnimationListView> createState() => _SwiperAnimationListViewState();
}

class _SwiperAnimationListViewState extends State<SwiperAnimationListView> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemWidth: 393.w,
      itemHeight: 590.h,
      loop: false,
      duration: 120,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return HorizontalSwiperListView();
      },
      itemCount: 10,
      layout: SwiperLayout.STACK,
    );
  }
}
