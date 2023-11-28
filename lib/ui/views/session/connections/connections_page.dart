import 'package:ekran/ui/views/session/connections/widgets/connections_scaffold.dart';
import 'package:ekran/ui/widgets/custom_box.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:ekran/ui/widgets/custom_match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionsPage extends StatelessWidget {
  const ConnectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectionsScaffold(
      titleWidget: null,
      bodyWidget: ListView(
        children: [
          CustomMatchCard(hasImage: true, matchRate: 59, name: "Furkan", age: 24, isSuccess: true),
          24.verticalSpace,
          CustomMatchCard(hasImage: true, matchRate: 21, name: "Elif", age: 24, isSuccess: false),
        ],
      ),
    );
  }
}
