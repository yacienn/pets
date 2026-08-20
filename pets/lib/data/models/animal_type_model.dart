class AnimaleTypeModel {
  final String type ;
  final String icon_url ;

  AnimaleTypeModel({required this.type , required this.icon_url});

  factory AnimaleTypeModel.fromJson(Map<String, dynamic> json) {
    return AnimaleTypeModel(
      type: json['animal_type'],
      icon_url: json['icon_url'],
    );
  }
}