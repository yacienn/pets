import 'package:flutter/material.dart';

import 'package:pet/core/theme/colors.dart';
import 'package:pet/domain/entities/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColors.primaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color.fromARGB(255, 189, 197, 202),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 190,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Image.asset(
                  animal.iconUrl,
                  width: double.infinity,
                  height: 110,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    animal.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}