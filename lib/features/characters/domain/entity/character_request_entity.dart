import '../../data/model/character_request_model.dart';

class CharacterRequestEntity {
  CharacterRequestEntity(
      {required this.apiKey,
      required this.timestamp,
      required this.hash,
      limit = 10,
      this.offset = 0});

  CharacterRequestModel toModel() =>
      CharacterRequestModel(apiKey: apiKey, ts: timestamp, hash: hash);

  final String apiKey;
  final String timestamp;
  final String hash;
  int? limit;
  int? offset;
}
