import 'package:ekran/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({Key? key, required this.onTap}) : super(key: key);
  Function(int) onTap;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(size: 48, color: Color(0xff6650FD)),
      unselectedIconTheme: const IconThemeData(size: 32, color: Color(0xffb1afaf)),
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          widget.onTap(currentIndex);
        });
      },
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AssetPath.locationIcon,
            )),
            label: ""),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AssetPath.userprofileIcon,
            )),
            label: ""),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AssetPath.homeIcon,
            )),
            label: ""),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AssetPath.chatIcon,
            )),
            label: ""),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AssetPath.settingsIcon,
            )),
            label: "")
      ],
    );
  }
}
