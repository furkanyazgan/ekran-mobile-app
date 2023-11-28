import 'package:ekran/ui/views/session/home/widgets/home_scaffold.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:ekran/ui/widgets/custom_match_card.dart';
import 'package:ekran/ui/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      titleWidget: Text("title"),
      bodyWidget: CustomCard(hasImage: true, matchRate: 43, name: "name", age: 18, isOnline: true, city: "city", country: "country"),

    );

  }
}




