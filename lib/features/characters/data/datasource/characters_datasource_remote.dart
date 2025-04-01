import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/character_response_wrapper_model.dart';

part 'characters_datasource_remote.g.dart';

@RestApi(baseUrl: 'https://gateway.marvel.com')
abstract class CharactersDatasourceRemote {
  factory CharactersDatasourceRemote(Dio dio, {String baseUrl}) =
      _CharactersDatasourceRemote;

  @GET('/v1/public/characters')
  Future<CharacterResponseWrapper> getCharacters(
      @Query('ts') String timestamp,
      @Query('apikey') String apiKey,
      @Query('hash') String hash,
      @Query('limit') int limit,
      @Query('offset') int offset);
}
