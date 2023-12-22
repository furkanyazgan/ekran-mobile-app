import 'package:chatview/chatview.dart';
import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/ui/views/session/chat/widgets/chat_scaffold.dart';
import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  final currentUser = ChatUser(
    id: '1',
    name: 'Furkan',
  );

  final _chatController = ChatController(
    initialMessageList: [
      Message(message: "naber", createdAt: DateTime.now(), sendBy: "2"),
      Message(message: "heyy", createdAt: DateTime.now(), sendBy: "2"),
      Message(message: "neeeffaber", createdAt: DateTime.now(), sendBy: "2"),
    ],
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(
        id: '2',
        name: 'Simform',
      ),
      ChatUser(
        id: '3',
        name: 'Jhon',
      ),
      ChatUser(
        id: '4',
        name: 'Mike',
      ),
      ChatUser(
        id: '5',
        name: 'Rich',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ChatScaffold(
        bodyWidget: Expanded(
          child: ChatView(
              chatController: _chatController, currentUser: currentUser, chatViewState: ChatViewState.hasMessages),
        ),
        titleWidget: null);
  }
}
