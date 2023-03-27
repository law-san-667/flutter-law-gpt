class ModelsModel {
  final String id;

  ModelsModel(this.id);
  
  factory ModelsModel.fromJson(Map<String, dynamic> json) {
    return ModelsModel(
      json['id']
      );
  }

  static List<ModelsModel> toModelsList(List jsonData){
    return jsonData.map((data) => ModelsModel.fromJson(data)).toList();
  }

}
