import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_fake_gpt/constants/api_const.dart';
import 'package:mobile_fake_gpt/models/chat_model.dart';
import 'package:mobile_fake_gpt/models/models_model.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"),
          headers: {'Authorization': 'Bearer $API_KEY'});
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      return ModelsModel.toModelsList(jsonResponse['data']);
    } catch (e) {
      log("Error in getModels: $e");
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(message, modelId) async {
    try {
      var response = await http.post(Uri.parse("$BASE_URL/completions"),
          headers: {
            'Authorization': 'Bearer $API_KEY',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'model': modelId,
            'prompt': message,
            'max_tokens': 100,
          }));

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      chatList = List.generate(
        jsonResponse['choices'].length,
        (index) => ChatModel(
          jsonResponse['choices'][index]['text'],
          0   ,
        ),
      );
      return chatList;
    } catch (e) {
      log("Error in sendMessage: $e");
      rethrow;
    }
  }
}
