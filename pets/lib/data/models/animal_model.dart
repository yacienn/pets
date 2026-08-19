class AnimalModel {
  final String id;
  final String name;
  final String type;
  final String iconUrl;

  AnimalModel({
    required this.id,
    required this.name,
    required this.type,
    required this.iconUrl,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      id: json['id'].toString(),
      name: json['animal_name'],
      type: json['animal_type'],
      iconUrl: json['icon_url'],
    );
  }
}