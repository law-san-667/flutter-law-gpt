import 'package:flutter/material.dart';
import 'package:mobile_fake_gpt/constants/constants.dart';
import 'package:mobile_fake_gpt/widgets/drop_down_button.dart';

class Services {

  static Future<void> showModalBottom(BuildContext context)async {
    await showModalBottomSheet(
        backgroundColor: cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Chosen model :",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Flexible(
                  flex: 1,
                  child: DropDownButton()
                  )
              ],
            ),
          );
        });
  }
}
