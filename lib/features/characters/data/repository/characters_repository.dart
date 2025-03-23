import '../../domain/entity/character_entity.dart';
import '../../domain/repository/characters_repository_interface.dart';
import '../datasource/characters_datasource_remote.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  CharactersRepository(this.remoteDatasource);

  final CharactersDatasourceRemote remoteDatasource;

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final results = await remoteDatasource.getCharacters();
    return results.map((json) => CharacterEntity.fromJson(json)).toList();
  }
}
