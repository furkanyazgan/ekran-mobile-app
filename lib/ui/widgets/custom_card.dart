import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/ui/views/session/home/widgets/custom_slidable_button.dart';
import 'package:ekran/ui/widgets/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: Add Swipe Animation
class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,

    required this.imagePath,
    required this.matchRate,
    required this.name,
    required this.age,
     this.gender,
     this.universityName,
    required this.isOnline,
    required this.city,
    required this.country,
  });

  final String imagePath;
  final String? gender;
  final String? universityName;
  final int matchRate;
  final String name;
  final int age;
  final bool isOnline;
  final String city;
  final String country;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, ),
          child: Container(
            height: 30.w,
            width: 230.h,
            decoration: BoxDecoration(
              color: themeProjectColors.boxColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.matchRate}%',
                      style: TextStyle(
                        color: themeProjectColors.backButtonColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp,
                      ),
                    ),
                    TextSpan(
                      text: ' Connection Rate',
                      style: TextStyle(
                        color: Colors.white,
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
              SizedBox(
                height: 140.h,
                width: 140.w,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(widget.imagePath),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.name,
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                        TextSpan(
                          text: ', ${widget.age}',
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: widget.isOnline ? const Color.fromRGBO(85, 173, 53, 1) : Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          widget.isOnline ? ' Active now' : ' Offline',
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '1 km Away',
                    style: TextStyle(
                      color: themeProjectColors.mainColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: themeProjectColors.mainColor,
                        ),
                        Text(
                          '${widget.city}, ${widget.country}',
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
          Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              CustomBox(text: widget.gender??""),
              CustomBox(
                text: widget.universityName??"",
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
        // _buildButton(themeProjectColors),

      ],
    );
  }

  Padding _buildButton(ProjectTheme themeProjectColors) {
    return Padding(
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
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
    );
  }
}
