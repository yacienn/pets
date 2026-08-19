class AnimaleTypeModel {
  final String type ;
  final String icon_path ;

  AnimaleTypeModel({required this.type , required this.icon_path});

  factory AnimaleTypeModel.fromJson(Map<String, dynamic> json) {
    return AnimaleTypeModel(
      type: json['animal_type'],
      icon_path: json['icon_url'],
    );
  }
}