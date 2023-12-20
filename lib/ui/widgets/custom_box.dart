import 'package:ekran/constants/project_themes.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    Key? key,
    required this.text,
    this.icon,
    this.showIcon = false,
  });
  final String text;
  final IconData? icon;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final themeProjectColors = Theme.of(context).extension<ProjectTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: themeProjectColors.boxColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              showIcon
                  ? Visibility(
                visible: showIcon,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                ),
              )
                  : Visibility(
                visible: showIcon,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}