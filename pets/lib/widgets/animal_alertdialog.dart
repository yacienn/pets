import 'package:flutter/material.dart';
import 'package:pet/domain/entities/animal.dart';
import 'package:uuid/uuid.dart';

class AddAnimalDialog extends StatefulWidget {
  const AddAnimalDialog({
    super.key,
  });

  @override
  State<AddAnimalDialog> createState() => _AddAnimalDialogState();
}

class _AddAnimalDialogState extends State<AddAnimalDialog> {
  final nameController = TextEditingController();
  final iconUrlController = TextEditingController();
  final typeController = TextEditingController();

  final Uuid uuid = const Uuid();

  @override
  void dispose() {
    nameController.dispose();
    iconUrlController.dispose();
    typeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Animal'),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter animal name',
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: iconUrlController,
            decoration: const InputDecoration(
              labelText: 'Icon URL',
              hintText: 'Enter icon URL',
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: typeController,
            decoration: const InputDecoration(
              labelText: 'Type',
              hintText: 'Enter animal type',
            ),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: () {
            final data = Animal(
              id: uuid.v4(),
              name: nameController.text,
              type: typeController.text,
              icon_url: iconUrlController.text,
            );

            Navigator.pop(context, data);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}