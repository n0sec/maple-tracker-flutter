import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/characters/characters_bloc.dart';
import '../widgets/character_creation_bottom_sheet.dart';
import '../widgets/character_tile.dart';

class CharacterSelectScreen extends StatelessWidget {
  const CharacterSelectScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.filter_alt),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      // drawer: const MenuDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
            ),
            builder: (context) => const CharacterCreationBottomSheet(),
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          }
          if (state is CharactersLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (BuildContext context, int index) {
                return CharacterTile(character: state.characters[index]);
              },
            );
          } else {
            return const Center(
              child: Text('Oops! There was a problem loading the characters.'),
            );
          }
        },
      ),
    );
  }
}
