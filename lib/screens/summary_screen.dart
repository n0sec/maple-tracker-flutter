import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_tracker_flutter/widgets/dailies_summary.dart';
import 'package:maple_tracker_flutter/widgets/menu_drawer.dart';

import '../blocs/characters/characters_bloc.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key, required this.title}) : super(key: key);

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
        actions: const [],
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<CharactersBloc, CharactersState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CharactersLoaded &&
                    state.selectedCharacter != null) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: Text(
                              'Hello ${state.selectedCharacter!.name}!',
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      DailiesSummary(
                          selectedCharacter: state.selectedCharacter),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No character selected! Go to Character Selection and select a character to see their Summary page.',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
