import 'package:app_maybe/config/helpers/get_yes_no_answer.dart';
import 'package:app_maybe/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [];
  final ScrollController myScrollController = ScrollController();
  final GetyesNoAnswer getyesNoAnswer = GetyesNoAnswer();

  Future<void> herResponse() async {
    final herMessage = await getyesNoAnswer.getAnswer();
    messageList.add(herMessage);
    moveScrollToButtom();
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (message.endsWith('?')) {
      herResponse();
    }
    moveScrollToButtom();
    notifyListeners();
  }

  Future<void> moveScrollToButtom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    myScrollController.animateTo(
      myScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
