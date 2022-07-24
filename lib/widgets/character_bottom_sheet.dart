import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_tracker_flutter/blocs/characters/characters_bloc.dart';
import 'package:maple_tracker_flutter/screens/edit_character_screen.dart';

import '../models/character.dart';

final editCharacterNameController = TextEditingController();

class CharacterBottomSheet extends StatelessWidget {
  const CharacterBottomSheet({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      listener: (context, state) {
        if (state is CharactersLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Character deleted!'),
            ),
          );
        }
      },
      child: Padding(
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCharacterScreen(
                          title: 'Edit Character',
                          character: character,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text("Are you sure?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<CharactersBloc>().add(
                                        DeleteCharacter(character: character),
                                      );
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        });
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
      ),
    );
  }
}
