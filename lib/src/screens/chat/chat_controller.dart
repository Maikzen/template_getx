import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/src/contracts/ai_interface.dart';
import 'package:template/src/contracts/local_data_interface.dart';

class ChatController extends GetxController {
  LocalDataInterface preferencesService;
  AIInterface aiService;

  ChatController({required this.preferencesService, required this.aiService});

  final RxList<String> messages = RxList([]);
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    String message = textEditingController.text;
    messages.insert(0, "User: $message");

    textEditingController.clear();

    aiService.getChatStream(message).listen((event) {
      if (messages.first.contains("User: ")) {
        messages.insert(0, "GPT: ");
      }
      messages[0] += event;
    });
  }

  // void _scrollToBottom() {
  //   scrollController.animateTo(
  //     0.0,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeOut,
  //   );
  // }
}
