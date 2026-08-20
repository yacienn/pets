import 'package:flutter/material.dart';

class AddAnimalDialog extends StatelessWidget {
  const AddAnimalDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Animal'),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter animal name',
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            decoration: const InputDecoration(
              labelText: 'Icon URL',
              hintText: 'Enter icon URL',
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
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}