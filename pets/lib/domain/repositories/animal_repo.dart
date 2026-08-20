import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';

abstract class AnimalRepo {
  Future<List<AnimalType>> getAnimalType();
  Future<List<Animal>> getRecentAnimal();
  Future<Animal> addAnimal();
}