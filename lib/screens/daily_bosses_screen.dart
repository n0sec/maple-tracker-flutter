import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_tracker_flutter/widgets/activity_tile.dart';

import '../blocs/characters/characters_bloc.dart';
import '../models/activity.dart';
import '../widgets/menu_drawer.dart';

class DailyBossesScreen extends StatelessWidget {
  const DailyBossesScreen({Key? key, required this.title}) : super(key: key);

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
        actions: [],
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          }
          if (state is CharactersLoaded && state.selectedCharacter != null) {
            return ListView.builder(
              itemCount: state.selectedCharacter?.incompleteDailyBosses.length,
              itemBuilder: (BuildContext context, int index) => ActivityTile(
                  task: state.selectedCharacter!.incompleteDailyBosses
                      .toList()[index]),
            );
          } else {
            return const Center(
              child: Text('Oops! There was a problem loading the bosses.'),
            );
          }
        },
      ),
    );
  }
}
