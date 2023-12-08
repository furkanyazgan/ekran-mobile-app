import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConnectionCard extends StatefulWidget {
  const ConnectionCard({Key? key}) : super(key: key);

  @override
  State<ConnectionCard> createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.r))),
      height: 590.h,
      width: 393.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Center(
            child: CustomCard(
                hasImage: true,
                matchRate: 43,
                name: "name",
                age: 18,
                isOnline: true,
                city: "city",
                country: "country")),
      ),
    );
  }
}
