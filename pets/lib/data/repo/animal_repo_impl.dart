import 'package:pet/data/data source/local/animal_local_ds.dart';
import 'package:pet/domain/entities/animal.dart';
import 'package:pet/domain/entities/animal_type.dart';
import 'package:pet/domain/repositories/animal_repo.dart';

class AnimalRepoImpl implements AnimalRepo {
  final AnimalLocalDataSource localDataSource;

  AnimalRepoImpl(this.localDataSource);

  @override
  Future<List<AnimalType>> getAnimalType() async {
    final models = await localDataSource.getAnimalTypes();
    return models
        .map((m) => AnimalType(type: m.type, icon_path: m.icon_path))
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
            type: AnimalType(type: m.type, icon_path: ''),
            iconUrl: m.iconUrl,
          ),
        )
        .toList();
  }
}