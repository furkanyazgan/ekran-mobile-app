import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/controllers/auth/auth_cubit.dart';
import 'package:ekran/core/models/enums/matching/categories/categories.dart';
import 'package:ekran/ui/screens/signup_and_login_screens/category_description_page.dart';
import 'package:ekran/ui/widgets/custom_radio_button.dart';
import 'package:ekran/ui/widgets/custom_scaffold.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekran/constants/project_themes.dart';
import 'package:ekran/constants/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // <Category,Description>Map
  Map<String, String?> categoriesMap = {
    "Photographs": null,
    "Music": null,
    "Horoscope": null,
    "Personality Questions": "Personality questions description",
    "Movies and TV Series": null,
    "Hobbies": null,
    "Logic Question": "Logic questoins description",
  };
  List<String> selectedCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return CustomScaffold(
      showContinueButton: true,
      titleWidget: Column(
        children: [
          Text(
            "Preferred Categories",
            textAlign: TextAlign.center,
            style: TextStyles.getTitleTextStyle(),
          ),
          3.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 46.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "You must choose at-least ",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                  TextSpan(
                    text: "2 ",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xffFFF73D)),
                  ),
                  TextSpan(
                    text: "categories for  virtual matching and at-least ",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                  TextSpan(
                    text: "4 ",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xffFFF73D)),
                  ),
                  TextSpan(
                    text: "categories for face to face",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bodyWidget: Column(
        children: [
          40.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomRadioButton(
                        child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Row(
                              children: [
                                Text(
                                  categoriesMap.keys.elementAt(index).toString(),
                                  style: TextStyles.getButtonTextStyle(),
                                ),
                                Spacer(),
                                _infoButtonCreator(
                                    categoriText: categoriesMap.keys.elementAt(index),
                                    descriptionText: categoriesMap.values.elementAt(index)),
                                7.horizontalSpace
                              ],
                            )),
                        height: 53.h,
                        selectedColor: Color(0xff21AFB5),
                        unSelectedColor: Color(0xff7acfd3),
                        value: Categories.values[index].name,
                        borderRadius: 10.r,
                        onTap: (value, isSelected) {
                          if (isSelected) {
                            selectedCategoriesList.add(value);
                          } else {
                            selectedCategoriesList.remove(value);
                          }
                          print(selectedCategoriesList);
                        }),
                    19.verticalSpace
                  ],
                );
              },
              itemCount: categoriesMap.length,
            ),
          ),
          116.verticalSpace
        ],
      ),
      continueButtonPress: () {
        context.read<AuthCubit>().setCategories(selectedCategoriesList: selectedCategoriesList).then((value) {
          if(value["status"] == false){
            _showSnackBar(context, "An error occurred");
          }
        });
      },
    );
  }

  Widget _infoButtonCreator({String? categoriText, String? descriptionText}) {
    return descriptionText != null
        ? IconButton(
            alignment: Alignment.topRight,
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      CategoryDescriptionPage(categoryText: categoriText!, descriptionText: descriptionText!)));
            },
            iconSize: 30.w,
            icon: Center(
              child: Image.asset(
                AssetPath.infoIcon,
                width: 30.w,
              ),
            ),
          )
        : SizedBox();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
