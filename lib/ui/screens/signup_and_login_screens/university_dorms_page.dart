import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';

class UniversityDormsPage extends StatelessWidget {
  const UniversityDormsPage({Key? key}) : super(key: key);

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
                  "Are you residing in your university dorms?",
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
                    CustomButton(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Yes",
                                  style: TextStyles.buttonTextStyle,
                                ),
                                Spacer()
                              ],
                            )),
                        width: 318,
                        height: 53,
                        color: Color(0xff7acfd3),
                        animationColor: Color(0xff21AFB5),
                        borderRadius: 10,
                        onTap: () {}),
                    SizedBox(
                      height: 22,
                    ),
                    CustomButton(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "No",
                                  style: TextStyles.buttonTextStyle,

                                ),
                                Spacer()
                              ],
                            )),
                        width: 318,
                        height: 53,
                        color: Color(0xff7acfd3),
                        animationColor: Color(0xff21AFB5),
                        borderRadius: 10,
                        onTap: () {}),
                    Spacer(),
                    TextButton(onPressed: (){

                    }, child: Text("or skip for now",style: TextStyle(fontSize: 22,color: Color(0xff9e9e9e)),)),
                    SizedBox(height: 74,)
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
