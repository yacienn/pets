import 'package:pet/data/models/animal_model.dart';
import 'package:pet/data/models/animal_type_model.dart';

abstract class AnimalLocalDataSource {
  Future<List<AnimaleTypeModel>> getAnimalTypes();
  Future<List<AnimalModel>> getRecentAnimals();
}

/// Local data source. In this implementation the "raw data" is a hardcoded
/// list of Maps (standing in for a JSON asset / local DB row), which is
/// then parsed through Model.fromJson() -- exactly like it would be if this
/// were reading a bundled .json file or a SQLite query result.
class AnimalLocalDataSourceImpl implements AnimalLocalDataSource {
  static final List<Map<String, dynamic>> animalTypesJson = [
    {'animal_type': 'Cat', 'icon_url': 'assets/pet_icons/cat.png'},
    {'animal_type': 'Dog', 'icon_url': 'assets/pet_icons/dog.png'},
    {'animal_type': 'Bird', 'icon_url': 'assets/pet_icons/bird.png'},
    {'animal_type': 'Rabbit', 'icon_url': 'assets/pet_icons/rabbit.png'},
    {'animal_type': 'Hamster', 'icon_url': 'assets/pet_icons/hamseter.png'},
    {'animal_type': 'Turtle', 'icon_url': 'assets/pet_icons/turtle.png'},
  ];

  static final List<Map<String, dynamic>> _recentAnimalsJson = [
    {
      'id': '1',
      'animal_name': 'Gosshii',
      'animal_type': 'Cat',
      'icon_url': 'assets/pet_icons/cat.png',
    },
    {
      'id': '2',
      'animal_name': 'Gosshii',
      'animal_type': 'Cat',
      'icon_url': 'assets/pet_icons/cat.png',
    },
  ];

  @override
  Future<List<AnimaleTypeModel>> getAnimalTypes() async {
    return animalTypesJson
        .map((json) => AnimaleTypeModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<AnimalModel>> getRecentAnimals() async {
    return _recentAnimalsJson
        .map((json) => AnimalModel.fromJson(json))
        .toList();
  }
}