import 'package:flutter/material.dart';
import 'package:pet/domain/entities/animal_type.dart';

class AnimalTypeCard extends StatelessWidget {
  final AnimalType animal;

  const AnimalTypeCard({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(
        right: 10,
        top: 10,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(
              animal.icon_path,
            ),
          ),
          Text(animal.type),
        ],
      ),
    );
  }
}