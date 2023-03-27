import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_fake_gpt/providers/models_provider.dart';
import 'package:mobile_fake_gpt/services/api_services.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return FutureBuilder(
        future: modelsProvider.getAllModels(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const Center(
                  child: SpinKitFadingCircle(
                  color: Colors.blue,
                ))
              : FittedBox(
                child: DropdownButton(
                    dropdownColor: cardColor,
                    value: modelsProvider.getCurrentModel,
                    items: getDropDownMenuItems(snapshot.data),
                    onChanged: (value) {
                      setState(() {
                        modelsProvider.setCurrentModel(value!);
                      });
                    },
                  ),
              );
        }));
  }
}
