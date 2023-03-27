import 'package:flutter/material.dart';
import 'package:mobile_fake_gpt/constants/constants.dart';

import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex})
      : super(key: key);

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Material(
        color: chatIndex % 2 == 0 ? scaffoldBackgroundColor : cardColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIndex % 2 == 0
                    ? AssetsManager.logoImage
                    : AssetsManager.userImage,
                width: 30,
                height: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    msg,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                  width: 60,
                  child: chatIndex % 2 == 0
                      ? Row(
                          children: const [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Colors.white,
                            )
                          ],
                        )
                      : null)
            ],
          ),
        ),
      )
    ]);
  }
}
