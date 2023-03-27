import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color.fromARGB(255, 51, 52, 73);
Color cardColor = const Color(0xFF444465);

final chatMessages = [
  {"msg": "Hello !", "chatIndex": 0},
  {"msg": "Hello, Who are you ?", "chatIndex": 1},
  {
    "msg":
        "I am a chatGPT, a large language model trained on a dataset of 8 million conversation pairs.",
    "chatIndex": 2
  },
  {"msg": "What is flutter ?", "chatIndex": 3},
  {
    "msg":
        "Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
    "chatIndex": 4
  }
];


List<DropdownMenuItem<String>>? getDropDownMenuItems(data) {
  List<DropdownMenuItem<String>> items = [];
  items = List<DropdownMenuItem<String>>.generate(data!.length, (index) {
    return DropdownMenuItem(
      value: data[index].id,
      child: Text(
        data[index].id,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  });
  return items;
}
