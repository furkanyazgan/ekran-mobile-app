import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/session/chat/chat_page.dart';
import 'package:ekran/ui/views/session/chat/chat_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageCard extends StatelessWidget {
  MessageCard({Key? key, required this.imagePath, required this.name}) : super(key: key);
  String imagePath;

  String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatPage(
                    name: name,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 82.h,
          child: Row(
            children: [
              SizedBox(
                  width: 66.w,
                  height: 66.h,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                  )),
              15.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  15.verticalSpace,
                  Text("What are you doing?", style: TextStyle(color: Colors.black54, fontSize: 16)),
                ],
              ),
              Spacer(),
              Column(
                children: [Text("7:25PM")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
