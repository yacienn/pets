import 'package:flutter/material.dart';
import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';
import 'package:pet/domain/usecases/animal_usecases.dart';

class HomeVm extends ChangeNotifier {
  final GetRecentAnimalUseCases _getRecentAnimalUseCases;
  final getAnimalTypeUseCases _getAnimalUseCases;
  HomeVm(this._getAnimalUseCases, this._getRecentAnimalUseCases);
  List<AnimalType> animalType = [];
  List<Animal> animal = [];
  Future<void> load() async {
    try {
      final types = await _getAnimalUseCases();
      final recent = await _getRecentAnimalUseCases();
      animalType = types ; 
      animal = recent ;
    } catch (e) {
    }
    notifyListeners();
  }
}
