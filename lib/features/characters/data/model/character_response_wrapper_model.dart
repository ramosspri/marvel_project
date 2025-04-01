
import 'package:json_annotation/json_annotation.dart';

import 'character_response_model.dart';

part 'character_response_wrapper_model.g.dart';

@JsonSerializable()
class CharacterResponseWrapper {
  CharacterResponseWrapper({required this.results});

  factory CharacterResponseWrapper.fromJson(Map<String, dynamic> json) =>
      CharacterResponseWrapper(
        results: (json['data']['results'] as List)
            .map((e) => CharacterResponseModel.fromJson(e))
            .toList(),
      );

  final List<CharacterResponseModel> results;
}
