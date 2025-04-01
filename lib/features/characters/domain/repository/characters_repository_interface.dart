import '../entity/character_entity.dart';
import '../entity/character_request_entity.dart';

abstract class CharactersRepositoryInterface {
  Future<List<CharacterEntity>> getCharacters(
      CharacterRequestEntity entity, int offset);
}
