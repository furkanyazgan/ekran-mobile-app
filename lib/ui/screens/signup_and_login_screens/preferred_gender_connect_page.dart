import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';

class PreferredGenderConnectPage extends StatelessWidget {
  const PreferredGenderConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Stack(
        children: [
          Wrap(
            children: [
              Opacity(
                opacity: 0.25,
                child: Image.asset(
                  AssetPath.userIcon3,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                  color: Color(0xFFF5F5F5),
                ),
              )
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 5,
                ),
                Image.asset(
                  AssetPath.ekranLogo,
                  width: 129,
                  height: 37,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Preferred Gender To Connect With",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Spacer(
                  flex: 45,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: MediaQuery.sizeOf(context).height * 0.69,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 78,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Male",
                                    style: TextStyles.buttonTextStyle,
                                  ),
                                  Spacer()
                                ],
                              )),

                          height: 53,
                          color: Color(0xff7acfd3),
                          animationColor: Color(0xff21AFB5),
                          borderRadius: 10,
                          onTap: () {}),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Female",
                                    style: TextStyles.buttonTextStyle,

                                  ),
                                  Spacer()
                                ],
                              )),

                          height: 53,
                          color: Color(0xff7acfd3),
                          animationColor: Color(0xff21AFB5),
                          borderRadius: 10,
                          onTap: () {}),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Both",
                                    style: TextStyles.buttonTextStyle,

                                  ),
                                  Spacer()
                                ],
                              )),

                          height: 53,
                          color: Color(0xff7acfd3),
                          animationColor: Color(0xff21AFB5),
                          borderRadius: 10,
                          onTap: () {}),
                    ),
                    Spacer(),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
