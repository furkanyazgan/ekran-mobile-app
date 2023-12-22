import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/session/chat/widgets/chat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as ChatTypes;

class ChatPage extends StatefulWidget {
  ChatPage({Key? key ,required this.name}) : super(key: key);
String name;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatTypes.Message> messages = [];
  late ChatTypes.User otherUser;
  late ChatTypes.User me;

  void _addMessage(ChatTypes.Message message) {
    setState(() {
      messages.add(message);
    });
  }

  void _handleSendPressed(ChatTypes.PartialText message) {
    final textMessage = ChatTypes.TextMessage(
      author: me,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "expID",
      text: message.text,
    );

    var payload = {
      'id': me.id,
      'msg': message.text,
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    };

    _addMessage(textMessage);
  }

  @override
  void initState() {
    otherUser = ChatTypes.User(id: "2", firstName: "Selin");
    me = ChatTypes.User(id: '1', firstName: widget.name,imageUrl: AssetPath.buse);

    // messages = [
    //   ChatTypes.TextMessage(
    //     author: me,
    //     createdAt: DateTime.now().millisecondsSinceEpoch,
    //     id: "1",
    //     text: "naber",
    //   ),
    //   ChatTypes.TextMessage(
    //     author: otherUser,
    //     createdAt: DateTime.now().millisecondsSinceEpoch,
    //     id: "2",
    //     text: "naber",
    //   ),
    //   ChatTypes.TextMessage(
    //     author: me,
    //     createdAt: DateTime.now().millisecondsSinceEpoch,
    //     id: "1",
    //     text: "naber",
    //   ),
    //   ChatTypes.TextMessage(
    //     author: me,
    //     createdAt: DateTime.now().millisecondsSinceEpoch,
    //     id: "1",
    //     text: "naber",
    //   ),
    //   ChatTypes.TextMessage(
    //     author: otherUser,
    //     createdAt: DateTime.now().millisecondsSinceEpoch,
    //     id: "2",
    //     text: "naber",
    //   )
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatScaffold(
      backButtonPress: () {
        Navigator.pop(context);
      },
      titleWidget: Text(widget.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      bodyWidget: Container(
        child: Chat(
          showUserAvatars: true,
          showUserNames: true,
          messages: messages,
          onSendPressed: _handleSendPressed,
          user: me,

        ),
      ),
    );
  }
}
