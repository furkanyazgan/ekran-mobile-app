import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/screens/signup_and_login_screens/university_or_around.dart';
import 'package:ekran/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class StartMainPage extends StatelessWidget {
  const StartMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 115),
              child: Wrap(
                children: [
                  Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      AssetPath.userIcon2,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                      color: Color(0xFFF5F5F5),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
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
                    "Lets get started!",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Spacer(
                    flex: 45,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 45,
                  ),
                  CustomButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      color: Color(0xff20AFB5),
                      width: 294,
                      height: 59,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => UniversityOrAroundPage()));
                      }),
                  Spacer(
                    flex: 1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            " Log In",
                            style: TextStyle(color: Color(0xffFFF73D)),
                          )
                        ],
                      )),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
