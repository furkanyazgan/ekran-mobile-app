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
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(25.r))),
      height: 590.h,
      width: 393.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Center(
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

            //TODO:This part should change when the photo starts being fetched from the database.
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Motto:",
                              style: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, 0.7),
                                fontWeight: FontWeight.w400,
                                fontSize: 24.sp,
                              ),
                            ),

                          ],
                        ),
                      ),

                     ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  CustomBox(text: 'Deneme'),
                  CustomBox(
                    text: 'Deneme',
                    icon: Icons.school_outlined,
                    showIcon: true,
                  ),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 400,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.white,
                      Color.fromARGB(202, 103, 80, 253),
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        AssetPath.userIcon,
                        color: themeProjectColors.mainColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            30.verticalSpace,
          ],
        )),
      ),
    );
  }
}
