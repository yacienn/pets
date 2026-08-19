import 'package:flutter/material.dart';
import 'package:pet/data/data%20source/local/animal_local_ds.dart';
import 'package:pet/data/repo/animal_repo_impl.dart';
import 'package:pet/domain/usecases/animal_usecases.dart';
import 'package:pet/presentation/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:pet/presentation/home/viewmodel/home_vm.dart';

void main() {
  final dataSource = AnimalLocalDataSourceImpl();

  final repository = AnimalRepoImpl(dataSource);

  final getAnimalTypes =
      getAnimalTypeUseCases(repository);

  final getRecentAnimals =
      GetRecentAnimalUseCases(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeVm(
            getAnimalTypes,
            getRecentAnimals,
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