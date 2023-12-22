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
        bodyWidget: SingleChildScrollView(
          child: Column(
            children: [
              30.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
              MessageCard(),
              5.verticalSpace,
            ],
          ),
        ),
        titleWidget: Text(
          "Messages",
          style: TextStyle(fontSize: 30.sp, color: Colors.white),
        ));
  }
}
