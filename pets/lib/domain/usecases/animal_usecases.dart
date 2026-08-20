
import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';
import 'package:pet/domain/repositories/animal_repo.dart';

class GetRecentAnimalUseCases{
  final AnimalRepo repo ;
  GetRecentAnimalUseCases( this.repo); 
  Future <List<Animal>> call(){
    return repo.getRecentAnimal();
  } 
}

class getAnimalTypeUseCases{
  final AnimalRepo repo ; 
  getAnimalTypeUseCases(this.repo);
  Future<List<AnimalType>> call(){
    return repo.getAnimalType();
  }
}

class addAnimalUseCases{
  final AnimalRepo repo ;
  addAnimalUseCases(this.repo , );
  Future<Animal> call(Animal animal)async{
  final result = await repo.addAnimal(animal);
  return result ;
  }
}
class getAllAnimalsUserCases{
  final AnimalRepo repo ;
  getAllAnimalsUserCases(this.repo );
  Future<List<Animal>> call()async{
  final result = await repo.getAllAnimals();
   return result ;
  }
}