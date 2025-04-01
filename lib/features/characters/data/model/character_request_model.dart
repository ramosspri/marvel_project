import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/character_request_entity.dart';

part 'character_request_model.g.dart';

@JsonSerializable()
class CharacterRequestModel {
  CharacterRequestModel(
      {required this.apiKey, required this.ts, required this.hash, this.limit});

  @JsonKey(name: 'api_key')
  final String apiKey;

  @JsonKey(name: 'ts')
  final String ts;

  final String hash;
  final int? limit;

  Map<String, dynamic> toJson() => _$CharacterRequestModelToJson(this);

  CharacterRequestEntity toEntity() =>
      CharacterRequestEntity(apiKey: apiKey, timestamp: ts, hash: hash);
}
