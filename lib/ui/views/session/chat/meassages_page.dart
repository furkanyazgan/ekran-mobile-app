import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/session/chat/widgets/chat_scaffold.dart';
import 'package:ekran/ui/views/session/chat/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatScaffold(
        showBackButton: false,
        bodyWidget: Column(
          children: [
            15.verticalSpace,
            Row(
              children: [
                15.horizontalSpace,
                Text(
                  "Virtual",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  10.verticalSpace,
                  MessageCard(
                    imagePath: AssetPath.buse,
                    name: "Buse",
                  ),
                  5.verticalSpace,
                  MessageCard(
                    imagePath: AssetPath.tolgahan,
                    name: "Tolgahan",
                  ),
                  5.verticalSpace,
                  MessageCard(
                    imagePath: AssetPath.melis,
                    name: "Melis",
                  ),
                  5.verticalSpace,
                  MessageCard(
                    imagePath: AssetPath.ege,
                    name: "ege",
                  ),
                  5.verticalSpace,
                ],
              ),
            )
          ],
        ),
        titleWidget: Text(
          "Messages",
          style: TextStyle(fontSize: 30.sp, color: Colors.white),
        ));
  }
}
