import 'package:flutter/material.dart';
import 'package:mobile_fake_gpt/models/chat_model.dart';

class ChatProvider with ChangeNotifier {
 List  _chats = [];

  List get getChats => _chats;

  void addChat(chat) {
    _chats.add(chat);
    notifyListeners();
  }

  void clearChats() {
    _chats.clear();
    notifyListeners();
  }

  ChatModel getFirstChat() {
    return _chats.first;
  }

  ChatModel getLastChat() {
    return _chats.last;
  }

  ChatModel getChat(int index) {
    return _chats[index];
  }

  int getLastChatIndex() {
    return _chats.length - 1;
  }

  int getNewChatIndex() {
    return _chats.length;
  }
}