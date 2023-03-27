import 'package:flutter/cupertino.dart';
import 'package:mobile_fake_gpt/services/api_services.dart';

import '../models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "text-davinci-003";
  List<String> models = [];

  String get getCurrentModel => currentModel;
  List<String> get getModels => models;

  void setCurrentModel(String model) {
    currentModel = model;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels() async {
    return await ApiService.getModels();
  }
}
