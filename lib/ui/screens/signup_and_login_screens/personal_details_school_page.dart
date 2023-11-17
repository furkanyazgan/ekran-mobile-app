import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/university_dorms_page.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:math';

class PersonalDetailsSchoolPage extends StatefulWidget {
  const PersonalDetailsSchoolPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsSchoolPage> createState() => _PersonalDetailsSchoolPageState();
}

class _PersonalDetailsSchoolPageState extends State<PersonalDetailsSchoolPage> {
  final List<String> items = ["Male", "Female", "Other"];
  String? selectedValue;

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
                  "Personal Details",
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
                      padding:
                      const EdgeInsets.only(left: 1, top: 10, bottom: 10),
                      child: Text(
                        "First Name",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff7e8086)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 1),
                            fillColor: Color(0xffC8EBED),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 1, top: 10, bottom: 10),
                      child: Text(
                        "Last Name",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff7e8086)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 1),
                            fillColor: Color(0xffC8EBED),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 1, top: 10, bottom: 10),
                      child: Text(
                        "School Email",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff7e8086)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 1),
                            fillColor: Color(0xffC8EBED),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Gender',
                          style:
                          TextStyle(fontSize: 20, color: Color(0xff928e9a)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.75),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 48,
                          padding: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Transform.rotate(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 18,
                            ),
                            angle: -90 * pi / 180,
                          ),
                          openMenuIcon: Transform.rotate(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 18,
                            ),
                            angle: 90 * pi / 180,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          elevation: 1,
                          maxHeight: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          offset: const Offset(0, -5),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                            MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 37, bottom: 45),
            child: Align(
              child: IconButton(
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => UniversityDormsPage()));

                },
                iconSize: 33,
                icon: Image.asset(
                  AssetPath.continueIcon,
                  color: themeProjectColors.mainColor,
                  width: 33,
                  height: 27,
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          )
        ],
      ),
    );
  }
}
