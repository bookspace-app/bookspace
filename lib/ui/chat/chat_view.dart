import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:bookspace/globals.dart' as globals;

class ChatView extends StatelessWidget {
  final StreamChatClient client;
  final Channel channel;

  /// To initialize this example, an instance of [client] and [channel] is required.
  ChatView(this.client, this.channel);

  initializeChat();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          child: widget,
          client: client,
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}

Future<void> initializeChat() async {
  final client = StreamChatClient(
    '59txtsjsxa7u',
    //logLevel: Level.INFO,
  );
  await client.connectUser(
    User(
      id: globals.id.toString(), //comprovar que s'ha de posar aquest id
      extraData: {
        'image':
            //get user image
            'http://local.getstream.io:9000/random_png/?id=still-mode-9&amp;name=still',
      },
    ),
    globals.token, //aixo s'ha de comprovar si es correcte
  );
  final channel = client.channel('messaging',
      id: 'godevs'); //quin id s'ha de posar per identificar cada canal? random?
  channel.watch();
}

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
