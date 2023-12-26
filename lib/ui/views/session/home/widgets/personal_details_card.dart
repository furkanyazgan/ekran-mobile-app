import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/widgets/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsCard extends StatefulWidget {
  const PersonalDetailsCard({
    super.key,
    required this.hasImage,
    required this.matchRate,
    required this.name,
    required this.age,
    required this.isOnline,
    required this.city,
    required this.country,
  });

  final bool hasImage;
  final int matchRate;
  final String name;
  final int age;
  final bool isOnline;
  final String city;
  final String country;

  @override
  State<PersonalDetailsCard> createState() => _PersonalDetailsCardState();
}

class _PersonalDetailsCardState extends State<PersonalDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Container(
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.r))),
      height: 590.h,
      width: 393.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                height: 30.w,
                width: 220.h,
                decoration: BoxDecoration(
                  color: themeProjectColors.boxColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Personal Details',
                          style: TextStyle(
                            color: themeProjectColors.backButtonColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Motto:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),                   5.verticalSpace,

                    Text(
                      '“Living my life in a way that I want.”',
                      style: TextStyle(fontSize: 16),
                    ), 15.verticalSpace,
                    Text(
                      "About Me:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                   5.verticalSpace,
                    Text(
                      'Just your average girl interested in music looking to make new friends at uni. Would love to meet like-minded people and hangout.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  CustomBox(text: 'Music',icon: Icons.music_note,showIcon: true,),

                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information:',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CustomBox(
                    text: 'Music',
                    icon: Icons.music_note_sharp,
                    showIcon: true,
                  ),
                  CustomBox(
                    text: '%20',
                    icon: Icons.person_outline_outlined,
                    showIcon: true,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CustomBox(
                    text: 'Horoscopes',
                    icon: Icons.movie,
                    showIcon: true,
                  ),
                  CustomBox(
                    text: '%0',
                    icon: Icons.person_outline_outlined,
                    showIcon: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
