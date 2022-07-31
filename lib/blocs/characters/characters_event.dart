part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharactersEvent {
  final List<Character> characters;

  const LoadCharacters({this.characters = const <Character>[]});

  @override
  List<Object> get props => [characters];
}

class AddCharacter extends CharactersEvent {
  final Character character;

  const AddCharacter({required this.character});

  @override
  List<Object> get props => [character];
}

class DeleteCharacter extends CharactersEvent {
  final Character character;

  const DeleteCharacter({required this.character});

  @override
  List<Object> get props => [character];
}

class SelectCharacter extends CharactersEvent {
  final Character character;

  const SelectCharacter({required this.character});

  @override
  List<Object> get props => [character];
}

class UpdateCharacter extends CharactersEvent {
  final Character characterToUpdate;
  final String newCharacterName;

  const UpdateCharacter(
      {required this.characterToUpdate, required this.newCharacterName});

  @override
  List<Object> get props => [characterToUpdate, newCharacterName];
}

class CompleteDailyBoss extends CharactersEvent {
  final Character characterToUpdate; // Should be the selected character
  final Task completedBoss;

  const CompleteDailyBoss(
      {required this.characterToUpdate, required this.completedBoss});

  @override
  List<Object> get props => [characterToUpdate, completedBoss];
}
