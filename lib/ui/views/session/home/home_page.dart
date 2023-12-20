import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/session/home/widgets/home_scaffold.dart';
import 'package:ekran/ui/views/session/home/widgets/horizontal_swiper_listview.dart';
import 'package:ekran/ui/views/session/home/widgets/swiper_animation_listview.dart';
import 'package:ekran/ui/widgets/custom_box.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:ekran/ui/widgets/custom_clip_box.dart';
import 'package:ekran/ui/widgets/custom_match_card.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      titleWidget: Row(
        children: [
          10.horizontalSpace,
          Icon(
            Icons.account_circle,
            size: 42.h,
            color: Colors.white,
          ),
          5.horizontalSpace,

          Icon(
            Icons.add_circle_outline,
            size: 30.h,
            color: Color(0xff6CFF54),
          ),
          Spacer(),
          CustomClipBox(
              child: Row(
            children: [
              Image.asset(
                AssetPath.groupUsers,
                width: 35,
              ),
              10.horizontalSpace,
              Text("Search\nGroup\nChat",style: TextStyle(fontSize: 8.sp),)
            ],
          )),
          10.horizontalSpace
        ],
      ),
      bodyWidget: SwiperAnimationListView(),
    );
  }
}

// CustomCard(hasImage: true, matchRate: 43, name: "name", age: 18, isOnline: true, city: "city", country: "country")
