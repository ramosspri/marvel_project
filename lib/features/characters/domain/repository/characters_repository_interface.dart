import '../entity/character_entity.dart';

abstract class CharactersRepositoryInterface {
  Future<List<CharacterEntity>> getCharacters();
}
