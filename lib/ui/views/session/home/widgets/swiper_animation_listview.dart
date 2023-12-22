import 'package:card_swiper/card_swiper.dart';
import 'package:ekran/core/services/test/test_service.dart';
import 'package:ekran/ui/views/session/home/widgets/horizontal_swiper_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperAnimationListView extends StatefulWidget {
    SwiperAnimationListView({Key? key}) : super(key: key);

  @override
  State<SwiperAnimationListView> createState() => _SwiperAnimationListViewState();
}

class _SwiperAnimationListViewState extends State<SwiperAnimationListView> {
  SwiperController _swiperController  = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Swiper(
      controller: _swiperController,
      onTap: (_){
        _swiperController.next();

      },

      itemWidth: 393.w,
      itemHeight: 590.h,
      loop: true,
      duration: 250,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return HorizontalSwiperListView(connectionModel: TestService.TestModelList[index],);
      },
      itemCount: 4,
      layout: SwiperLayout.STACK,
    );
  }
}
