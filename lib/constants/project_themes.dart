import 'package:flutter/material.dart';

@immutable
class ProjectTheme extends ThemeExtension<ProjectTheme> {
  const ProjectTheme({
    required this.mainColor,
    required this.backButtonColor,
    required this.buttonSelectColor,
    required this.scaffoldBackgroundColor,
    required this.sectionBackgroundColor,
    required this.tabBarColor,
    required this.appBarColor,
    required this.containerColor,
    required this.buySellContainerColor,
    required this.borderColor,
    required this.titleTextColor,
    required this.titleDataTextColor,
    required this.webUrlTextColor,
    required this.iconColor,
    required this.borderCircleColor,
    required this.boxColor,
    this.ozakLogoPath,
    this.dovizLogoPath,
    this.sarrafiyeLogoPath,
    this.themeChangeButtonImagePath,
    this.menuButtonImagePath,
  });

  final Color? mainColor;
  final Color? backButtonColor;
  final Color? scaffoldBackgroundColor;
  final Color? sectionBackgroundColor;
  final Color? buttonSelectColor;
  final Color? tabBarColor;
  final Color? appBarColor;
  final Color? containerColor;
  final Color? buySellContainerColor;
  final Color? borderColor;
  final Color? titleTextColor;
  final Color? titleDataTextColor;
  final Color? webUrlTextColor;
  final Color? iconColor;
  final Color? borderCircleColor;
  final Color? boxColor;
  final String? ozakLogoPath;
  final String? dovizLogoPath;
  final String? sarrafiyeLogoPath;
  final String? themeChangeButtonImagePath;
  final String? menuButtonImagePath;

  @override
  ProjectTheme copyWith({
    Color? mainColor,
    Color? backButtonColor,
    Color? scaffoldBackgroundColor,
    Color? sectionBackgroundColor,
    Color? buttonSelectColor,
    Color? tabBarColor,
    Color? appBarColor,
    Color? containerColor,
    Color? buySellContainerColor,
    Color? borderColor,
    Color? titleTextColor,
    Color? titleDataTextColor,
    Color? webUrlTextColor,
    Color? iconColor,
    Color? borderCircleColor,
    Color? boxColor,
    String? ozakLogoPath,
    String? dovizLogoPath,
    String? sarrafiyeLogoPath,
    String? themeChangeButtonImagePath,
    String? menuButtonImagePath,
  }) {
    return ProjectTheme(
      mainColor: mainColor ?? this.mainColor,
      backButtonColor: backButtonColor ?? this.backButtonColor,
      scaffoldBackgroundColor:
      scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      sectionBackgroundColor:
      sectionBackgroundColor ?? this.sectionBackgroundColor,
      buttonSelectColor: buttonSelectColor ?? this.buttonSelectColor,
      tabBarColor: tabBarColor ?? this.tabBarColor,
      appBarColor: appBarColor ?? this.appBarColor,
      containerColor: containerColor ?? this.containerColor,
      buySellContainerColor:
      buySellContainerColor ?? this.buySellContainerColor,
      borderColor: borderColor ?? this.borderColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      titleDataTextColor: titleDataTextColor ?? this.titleDataTextColor,
      webUrlTextColor: webUrlTextColor ?? this.webUrlTextColor,
      iconColor: iconColor ?? this.iconColor,
      borderCircleColor: borderCircleColor ?? this.borderCircleColor,
      boxColor: boxColor ?? this.boxColor,
      ozakLogoPath: ozakLogoPath ?? this.ozakLogoPath,
      dovizLogoPath: dovizLogoPath ?? this.dovizLogoPath,
      sarrafiyeLogoPath: sarrafiyeLogoPath ?? this.sarrafiyeLogoPath,
      themeChangeButtonImagePath:
      themeChangeButtonImagePath ?? this.themeChangeButtonImagePath,
      menuButtonImagePath: menuButtonImagePath ?? this.menuButtonImagePath,
    );
  }

  // the light theme
  static const light = ProjectTheme(
    mainColor: Color(0xFF6650FD),
    backButtonColor: Color(0xffFFF73D),
    scaffoldBackgroundColor: Color(0xFFFAFAFA),
    sectionBackgroundColor: Color(0xFFFFFFFF),
    buttonSelectColor: Color(0xFFE7A707),
    tabBarColor: Color(0xFFF0EFEA),
    appBarColor: Color(0xFFFFFFFF),
    containerColor: Color(0xFFFAFAFA),
    buySellContainerColor: Color(0xFFF5F7F8),
    borderColor: Color(0xFFF5F7F8),
    titleTextColor: Color(0xFF435F75),
    titleDataTextColor: Color(0xFF2C2A2A),
    webUrlTextColor: Color(0xFFE7A707),
    iconColor: Color(0xFF2C2A2A),
    borderCircleColor: Color(0xFF435F75),
    boxColor: Color(0xFF20AFB5),
    ozakLogoPath: "assets/images/ozak-light-theme.png",
    dovizLogoPath: "assets/images/dövizLogo-light-theme.png",
    sarrafiyeLogoPath: "assets/images/sarrafiyeLogo-light-theme.png",
    themeChangeButtonImagePath: "assets/images/moon.png",
    menuButtonImagePath: "assets/images/menu-light-theme.png",
  );

  @override
  ProjectTheme lerp(ThemeExtension<ProjectTheme>? other, double time) {
    double t = time / 15;
    if (other is! ProjectTheme) {
      return this;
    }

    return ProjectTheme(
      mainColor: Color.lerp(mainColor, other.mainColor, t),
      backButtonColor: Color.lerp(backButtonColor, other.backButtonColor, t),
      scaffoldBackgroundColor:
      Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
      sectionBackgroundColor:
      Color.lerp(sectionBackgroundColor, other.sectionBackgroundColor, t),
      buttonSelectColor:
      Color.lerp(buttonSelectColor, other.buttonSelectColor, t),
      tabBarColor: Color.lerp(tabBarColor, other.tabBarColor, t),
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t),
      containerColor: Color.lerp(containerColor, other.containerColor, t),
      buySellContainerColor:
      Color.lerp(buySellContainerColor, other.buySellContainerColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t),
      titleDataTextColor:
      Color.lerp(titleDataTextColor, other.titleDataTextColor, t),
      webUrlTextColor: Color.lerp(webUrlTextColor, other.webUrlTextColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      borderCircleColor:
      Color.lerp(borderCircleColor, other.borderCircleColor, t),
      ozakLogoPath: ozakLogoPath,
      dovizLogoPath: dovizLogoPath,
      sarrafiyeLogoPath: sarrafiyeLogoPath,
      themeChangeButtonImagePath: themeChangeButtonImagePath,
      menuButtonImagePath: menuButtonImagePath,
      boxColor: Color.lerp(boxColor, other.boxColor, t),
    );
  }
}