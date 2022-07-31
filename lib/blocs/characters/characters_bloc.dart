import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/activity.dart';
import '../../models/character.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoading()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<AddCharacter>(_onAddCharacter);
    on<DeleteCharacter>(_onDeleteCharacter);
    on<SelectCharacter>(_onSelectCharacter);
    on<UpdateCharacter>(_onUpdateCharacter);
    on<CompleteDailyBoss>(_onCompleteDailyBoss);
  }

  void _onLoadCharacters(LoadCharacters event, Emitter<CharactersState> emit) {
    emit(
      CharactersLoaded(characters: event.characters, selectedCharacter: null),
    );
  }

  void _onAddCharacter(AddCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      emit(
        state.copyWith(
          characters: List.from(state.characters)..add(event.character),
        ),
      );
    }
  }

  void _onDeleteCharacter(
      DeleteCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      emit(
        state.copyWith(
          characters: List.from(state.characters)..remove(event.character),
        ),
      );
    }
  }

  void _onSelectCharacter(
      SelectCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      emit(
        state.copyWith(selectedCharacter: event.character),
      );
    }
  }

  void _onUpdateCharacter(
      UpdateCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      final characters = state.characters.toList();
      final characterToUpdateIndex =
          characters.indexOf(event.characterToUpdate);
      if (characterToUpdateIndex.isNegative) return;
      final newCharacter = characters[characterToUpdateIndex]
          .copyWith(name: event.newCharacterName);
      characters[characterToUpdateIndex] = newCharacter;
      emit(
        state.copyWith(
          characters: characters,
        ),
      );
    }
  }

  void _onCompleteDailyBoss(
      CompleteDailyBoss event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      event.characterToUpdate.copyWith(completedDailyBosses: {
        event.completedBoss,
        ...?state.selectedCharacter?.completedDailyBosses
      });
      emit(state.copyWith(selectedCharacter: event.characterToUpdate));
    }
  }
}
