import 'package:app_maybe/domain/entities/message.dart';
import 'package:app_maybe/presentation/providers/chat_provider.dart';
import 'package:app_maybe/presentation/widgets/chat/her_message_bubble.dart';
import 'package:app_maybe/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/641661554820190208/0pekIUcN_400x400.jpg'),
          ),
        ),
        title: const Text('Chat'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                controller: chatProvider.myScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.me)
                      ? MyMessageWidget(
                          text: message.text,
                        )
                      : HerMessageWidget(
                          text: message.text,
                          imageUlr: message.imageUrl,
                        );
                },
              ),
            ),
          ),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          )
        ],
      ),
    );
  }
}
