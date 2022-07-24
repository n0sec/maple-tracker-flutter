import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
  }

  void _onLoadCharacters(LoadCharacters event, Emitter<CharactersState> emit) {
    emit(
      CharactersLoaded(characters: event.characters),
    );
  }

  void _onAddCharacter(AddCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      emit(
        CharactersLoaded(
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
        CharactersLoaded(
          characters: List.from(state.characters)..remove(event.character),
        ),
      );
    }
  }

  void _onSelectCharacter(
      SelectCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharacterSelected) {
      emit(
        CharacterSelected(state.selectedCharacter),
      );
    }
  }

  void _onUpdateCharacter(
      UpdateCharacter event, Emitter<CharactersState> emit) {
    final state = this.state;
    if (state is CharactersLoaded) {
      final updatedCharacter =
          event.characterToUpdate.copyWith(name: event.newCharacterName);
      emit(state.copyWith(character: updatedCharacter));
    }
  }
}
