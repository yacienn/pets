import 'package:flutter/material.dart';
import 'package:pet/core/network/api_client.dart';
import 'package:pet/data/data%20source/local/local/animal_local_ds.dart';
import 'package:pet/data/data%20source/local/remote/animal_remote_ds.dart';
import 'package:pet/data/repo/animal_repo_impl.dart';
import 'package:pet/domain/usecases/animal_usecases.dart';
import 'package:pet/presentation/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:pet/presentation/home/viewmodel/home_vm.dart';

void main() {
  final ApiClient api = ApiClient(); 
  final dataSource = AnimalLocalDataSourceImpl();
  final remoteds = AnimalRemoteDs(api);
  final repository = AnimalRepoImpl(dataSource , remoteds);

  final getAnimalTypes =
      getAnimalTypeUseCases(repository);

  final getRecentAnimals =
      getAllAnimalsUserCases(repository);

  final addAnimal =
       addAnimalUseCases(repository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeVm(
            getAnimalTypes,
            getRecentAnimals,
            addAnimal
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}