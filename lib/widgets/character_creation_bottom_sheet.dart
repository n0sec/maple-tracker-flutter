import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterCreationBottomSheet extends StatefulWidget {
  const CharacterCreationBottomSheet({Key? key}) : super(key: key);

  @override
  State<CharacterCreationBottomSheet> createState() =>
      _CharacterCreationBottomSheetState();
}

class _CharacterCreationBottomSheetState
    extends State<CharacterCreationBottomSheet> {
  final characterNameController = TextEditingController();
  MapleClass dropdownValue = MapleClass.adele;

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
              TextField(
                maxLength: 12,
                controller: characterNameController,
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
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: (MapleClass? newValue) {
                  setState(
                    () {
                      dropdownValue = newValue!;
                    },
                  );
                },
                value: dropdownValue,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  if (characterNameController.text == '') {
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
                    // TODO: Do stuff
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
    );
  }
}
