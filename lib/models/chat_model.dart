class ChatModel {
  final String message;
  final int chatIndex;

  ChatModel(this.message, this.chatIndex);

  factory ChatModel.fromJson(Map<String, dynamic> json) => 
  ChatModel(
      json['text'],
      json['index'],
    );

  static ChatModel toChatModel(Map<String, dynamic> json) {
    return ChatModel.fromJson(json);
  }
}
