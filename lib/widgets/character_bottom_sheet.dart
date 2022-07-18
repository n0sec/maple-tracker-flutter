import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';

final editCharacterNameController = TextEditingController();

class CharacterBottomSheet extends StatelessWidget {
  const CharacterBottomSheet({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        title: const Text('Edit Character Name'),
                        content: TextField(
                          controller: editCharacterNameController,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Character Name',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              print(character);
                            },
                            child: const Text('Done'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
