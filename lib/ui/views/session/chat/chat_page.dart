import 'package:ekran/ui/views/session/chat/widgets/chat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as ChatTypes;

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatTypes.Message> _messages = [];
  late ChatTypes.User otherUser;
  late ChatTypes.User me;

  void _addMessage(ChatTypes.Message message) {
    setState(() {
      _messages.insert(0, message);
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
    otherUser = ChatTypes.User(id: "OtherUser", firstName: "OtherUser");
    me = const ChatTypes.User(id: 'Fareez', firstName: 'Fareez');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatScaffold(
      backButtonPress: () {
        Navigator.pop(context);
      },
      titleWidget: Text("Pelin Balcan"),
      bodyWidget:           Container(
        child: Chat(
          showUserAvatars: true,
          showUserNames: true,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: me,
        ),
      )
      ,
    );
  }
}
