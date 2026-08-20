import 'package:pet/data/data%20source/local/local/animal_local_ds.dart';
import 'package:pet/data/data%20source/local/remote/animal_remote_ds.dart';
import 'package:pet/data/models/animal_model.dart';
import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';
import 'package:pet/domain/repositories/animal_repo.dart';

class AnimalRepoImpl implements AnimalRepo {
  final AnimalLocalDataSource localDataSource;
  final AnimalRemoteDs remoteDs;

  AnimalRepoImpl(
    this.localDataSource,
    this.remoteDs,
  );


  @override
  Future<List<AnimalType>> getAnimalType() async {
    final models = await localDataSource.getAnimalTypes();
    return models
        .map(
          (m) => AnimalType(
            type: m.type,
            icon_path: m.icon_url,
          ),
        )
        .toList();
  }


  @override
  Future<List<Animal>> getRecentAnimal() async {
    final models = await localDataSource.getRecentAnimals();
    return models
        .map(
          (m) => Animal(
            id: m.id,
            name: m.name,
            type: m.type,
            icon_url: m.iconUrl,
          ),
        )
        .toList();
  }


  @override
  Future<Animal> addAnimal(Animal animal) async {
    final model = AnimalModel(
      id: animal.id,
      name: animal.name,
      type: animal.type,
      iconUrl: animal.icon_url,
    );
    final result = await remoteDs.addAnimalTodb(model);
    return Animal(
      id: result.id,
      name: result.name,
      type: result.type,
      icon_url: result.iconUrl,
    );
  }


@override 
Future<List<Animal>> getAllAnimals()async{
  final result = await remoteDs.getAllAnimalsFromdb();
  return result
        .map(
          (m) => Animal(
            id: m.id,
            name: m.name,
            type: m.type,
            icon_url: m.iconUrl,
          ),
        )
        .toList();
}


}