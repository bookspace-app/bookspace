import 'package:bookspace/ui/chat/channel_page.dart';
import 'package:bookspace/ui/chat/stream_api.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:bookspace/globals.dart' as globals;

class ChatView extends StatefulWidget {
  ChatView({Key key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  String chatApiKey = '59txtsjsxa7u';
  Client clientG;
  Channel channelG;

  @override
  void initState() {
    initializeChat();
    super.initState();
  }

  void initializeChat() async {
    clientG = Client(chatApiKey, logLevel: Level.SEVERE);

    await StreamApi.initUser(clientG,
        username: 'usernameRandom',
        urlImage:
            'https://digitalisthub.com/wp-content/uploads/2017/02/google-logo.jpg',
        id: '1',
        token: 'arstydfjkg');

    List members = ['1', '2'];
    channelG = await StreamApi.createChannel(clientG,
        type: 'messaging',
        name: 'channelName',
        id: 'sample',
        image:
            'https://digitalisthub.com/wp-content/uploads/2017/02/google-logo.jpg',
        idMembers: members);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHATS"),
      ),
      body: StreamChat(
        child: StreamChannel(
          child: ChannelPage(),
          channel: channelG,
        ),
      ),
    );
  }
}
