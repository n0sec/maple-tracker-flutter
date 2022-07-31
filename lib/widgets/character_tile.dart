import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_tracker_flutter/blocs/characters/characters_bloc.dart';

import '../models/character.dart';
import 'character_bottom_sheet.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Color(character.mapleClass.classColor),
          highlightColor: Color(character.mapleClass.classColor),
          onTap: () {
            context.read<CharactersBloc>().add(
                  SelectCharacter(character: character),
                );
            Navigator.pushReplacementNamed(context, '/summary');
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => CharacterBottomSheet(character: character),
            );
          },
          child: SizedBox(
            height: 120,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    character.mapleClass.assetPath,
                    width: 100,
                    height: 104,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          character.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          character.mapleClass.className,
                          style: TextStyle(
                            fontSize: 14,
                            // fontStyle: FontStyle.italic,
                            color: Color(character.mapleClass.classColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 28,
                      ),
                      onTap: () => {
                        print('Favorite clicked'),
                      },
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
