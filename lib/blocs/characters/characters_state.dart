part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object?> get props => [];
}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  const CharactersLoaded({
    this.characters = const <Character>[],
    this.selectedCharacter,
  });
  final List<Character> characters;
  final Character? selectedCharacter;

  @override
  List<Object?> get props => [characters, selectedCharacter];

  CharactersLoaded copyWith({
    List<Character>? characters,
    Character? selectedCharacter,
  }) {
    return CharactersLoaded(
      characters: characters ?? this.characters,
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
    );
  }
}
