import 'package:flutter/material.dart';
import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';
import 'package:pet/domain/usecases/animal_usecases.dart';

class HomeVm extends ChangeNotifier {
  final GetRecentAnimalUseCases _getRecentAnimalUseCases;
  final getAnimalTypeUseCases _getAnimalUseCases;
  final addAnimalUseCases _addAnimalUsecases ;


  HomeVm(this._getAnimalUseCases, this._getRecentAnimalUseCases , this._addAnimalUsecases);
  List<AnimalType> animalType = [];
  List<Animal> animal = [];
  Future<void> load() async {
  try {
    final types = await _getAnimalUseCases();       // ①
    final recent = await _getRecentAnimalUseCases(); // ②
    animalType = types;   // ← only runs if ② succeeds
    animal = recent;
  } catch (e) {
    print("${e}");
  }
  notifyListeners();
}
 Future<void> add(Animal animal) async {
  final newAnimal = await _addAnimalUsecases.call(animal);
  this.animal.add(newAnimal);
  notifyListeners();
}
}
