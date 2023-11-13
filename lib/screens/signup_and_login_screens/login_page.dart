import 'package:ekran/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _UniversitsssyOrAroundPageState();
}

class _UniversitsssyOrAroundPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Scaffold(
      backgroundColor: themeProjectColors.mainColor,
      body: Stack(
        children: [
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
                  "Log In",
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 10),
                      child: Text(
                        "Email:",
                        style:
                            TextStyle(fontSize: 24, color: Color(0xff7e8086)),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          fillColor: Color(0xfff5f5f5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Password:",
                        style:
                            TextStyle(fontSize: 24, color: Color(0xff7e8086)),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          fillColor: Color(0xfff5f5f5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgoten Password?",
                        style: TextStyle(
                            fontSize: 16, color: themeProjectColors.mainColor),
                      ),
                    )
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
