import '../../domain/entity/character_entity.dart';

abstract class CharactersState {}

class InitialState extends CharactersState {}

class Loading extends CharactersState {}

class LoadMoreCharacters extends CharactersState {}

class SuccessGetCharacters extends CharactersState {
  SuccessGetCharacters({required this.characters});

  List<CharacterEntity> characters;
}

class ErrorGetCharacters extends CharactersState {
  ErrorGetCharacters({required this.message});

  final String message;
}
