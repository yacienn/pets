import 'package:pet/domain/entities/animal_type.dart';

class Animal {
  final String id;
  final String name;
  final String type;
  final String iconUrl;

  const Animal({
    required this.id,
    required this.name,
    required this.type,
    required this.iconUrl,
  });
}