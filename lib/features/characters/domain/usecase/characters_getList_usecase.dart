import '../../../../shared/interface/usecase_interface.dart';
import '../../data/repository/characters_repository.dart';
import '../entity/character_entity.dart';
import '../entity/character_request_entity.dart';
import '../repository/characters_repository_interface.dart';

class CharactersGetListUsecase
    implements UsecaseInterface<List<CharacterEntity>, CharacterRequestEntity> {
  final CharactersRepositoryInterface repository = CharactersRepository();

  @override
  Future<List<CharacterEntity>> call(CharacterRequestEntity params) async {
    final offset = params.offset ?? 0;

    return repository.getCharacters(params, offset);
  }
}
