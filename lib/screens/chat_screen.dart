import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_fake_gpt/constants/constants.dart';
import 'package:mobile_fake_gpt/models/chat_model.dart';
import 'package:mobile_fake_gpt/providers/chat_provider.dart';
import 'package:mobile_fake_gpt/providers/models_provider.dart';
import 'package:mobile_fake_gpt/services/api_services.dart';
import 'package:mobile_fake_gpt/services/assets_manager.dart';
import 'package:mobile_fake_gpt/widgets/chat_widget.dart';
import 'package:mobile_fake_gpt/services/services.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController textEditingController;
  bool _isTyping = false;
  List<ChatModel> chatList = [
    ChatModel(
      "Hi, I'm GPT-3. What's your name?",
      0,
    ),
  ];

  @override
  void initState() {
    textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalBottom(context);
            },
            icon: const Icon(Icons.more_vert_rounded),
          )
        ],
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            AssetsManager.logoImage,
          ),
        ),
        title: const Text("LAW GPT 69"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Flexible(
                  child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatList[index].message,
                    chatIndex: chatList[index].chatIndex,
                  );
                },
              )),
              if (_isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                )
              ],
              SizedBox(
                height: 55,
                child: Material(
                  color: cardColor,
                  child: Row(
                    children: [
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) async {
                            await doSendMessage(ModelsProvider());
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "What can I do for you ?",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )),
                      IconButton(
                          onPressed: () async {
                            await doSendMessage(ModelsProvider());
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> doSendMessage(ModelsProvider modelsProvider) async {
    try {
      final list = await ApiService.sendMessage(
          textEditingController.text, ModelsProvider().getCurrentModel);
      setState(() {
        chatList.add(ChatModel(
            textEditingController.text, 1));
        final item = list.first;
        ChatProvider().addChat(item);
        chatList.add(item);
        textEditingController.clear();
      });
    } on Exception catch (e) {
      log("Error $e");
    } finally {
      _isTyping = false;
    }
  }
}
