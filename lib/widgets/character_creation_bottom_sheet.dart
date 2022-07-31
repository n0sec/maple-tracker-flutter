import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_tracker_flutter/blocs/characters/characters_bloc.dart';

import '../models/character.dart';

class CharacterCreationBottomSheet extends StatefulWidget {
  const CharacterCreationBottomSheet({Key? key}) : super(key: key);

  @override
  State<CharacterCreationBottomSheet> createState() =>
      _CharacterCreationBottomSheetState();
}

class _CharacterCreationBottomSheetState
    extends State<CharacterCreationBottomSheet> {
  final _characterNameController = TextEditingController();
  MapleClass _dropdownValue = MapleClass.adele;

  @override
  void dispose() {
    _characterNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      listener: (context, state) {
        if (state is CharactersLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Character added!'),
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
                TextField(
                  maxLength: 12,
                  controller: _characterNameController,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Character Name',
                  ),
                ),
                DropdownButton<MapleClass>(
                  hint: const Text('Class Name'),
                  isExpanded: true,
                  items: MapleClass.values
                      .map<DropdownMenuItem<MapleClass>>(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.className),
                        ),
                      )
                      .toList(),
                  onChanged: (MapleClass? newValue) {
                    setState(
                      () {
                        _dropdownValue = newValue!;
                      },
                    );
                  },
                  value: _dropdownValue,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    if (_characterNameController.text == '') {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            title: const Text('Error'),
                            content:
                                const Text('Character names cannot be blank.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      var createdCharacter = Character(
                        name: _characterNameController.text,
                        mapleClass: _dropdownValue,
                        isFavorite: false,
                        completedDailyBosses: const {},
                        completedDailyTasks: const {},
                        completedDailyArcaneRiver: const {},
                        completedWeeklyBosses: const {},
                        completedWeeklyTasks: const {},
                      );
                      context.read<CharactersBloc>().add(
                            AddCharacter(character: createdCharacter),
                          );
                      // _characterNameController.dispose();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
