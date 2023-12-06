import 'package:ekran/constants/text_styles.dart';
import 'package:ekran/ui/widgets/custom_box.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinePage extends StatefulWidget {
  const OutlinePage({Key? key}) : super(key: key);

  @override
  State<OutlinePage> createState() => _OutlinePageState();
}

class _OutlinePageState extends State<OutlinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        titleWidget: Text(
          "Outline",
          style: TextStyles.getTitleTextStyle(),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            Text(
              "Motto:",
              style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
            ),
            8.verticalSpace,
            SizedBox(
              height: 36.h,
              child: TextFormField(
                onChanged: (value) {},
                style: TextStyle(fontSize: 18.sp),
                decoration: InputDecoration(
                    errorStyle: const TextStyle(height: 0),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                    fillColor: Color(0xffC8EBED),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(5.r)))),
              ),
            ),
            15.verticalSpace,
            Text(
              "About Me:",
              style: TextStyle(fontSize: 20.sp, color: Color(0xff7e8086)),
            ),
            8.verticalSpace,
            TextFormField(
              minLines: 5,
              maxLines: 10,
              onChanged: (value) {},
              style: TextStyle(fontSize: 18.sp),
              decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 100),
                  errorStyle: const TextStyle(height: 0),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  fillColor: Color(0xffC8EBED),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(5.r)))),
            ),
            15.verticalSpace,
            SizedBox(
              child: CustomBox(
                text: "Music",
                icon: Icons.music_note_outlined,
                showIcon: true,
              ),
              width: 92.w,
            ),
            15.verticalSpace,
            Row(
              children: [Text("Top Artist:",style: TextStyle(fontWeight: FontWeight.bold),),Text("  The Weekend")],
            ),
            15.verticalSpace,
            Row(
              children: [Text("Top Genre",style: TextStyle(fontWeight: FontWeight.bold),),Text("  Pop")],
            ),
            15.verticalSpace,
            SizedBox(
              child: CustomBox(
                text: "Horoscopes",
                icon: Icons.movie,
                showIcon: true,
              ),
              width: 125.w,
            ),
            15.verticalSpace,
            Text("Gemini")

          ],
        ));
  }
}
