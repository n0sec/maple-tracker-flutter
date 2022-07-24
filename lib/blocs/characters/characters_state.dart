part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  const CharactersLoaded({this.characters = const <Character>[]});

  @override
  List<Object> get props => [characters];
}

class CharacterSelected extends CharactersState {
  final Character selectedCharacter;

  const CharacterSelected(this.selectedCharacter);

  @override
  List<Object> get props => [selectedCharacter];
}

class CharacterUpdated extends CharactersState {
  final Character updatedCharacter;

  const CharacterUpdated(this.updatedCharacter);

  @override
  List<Object> get props => [updatedCharacter];
}
