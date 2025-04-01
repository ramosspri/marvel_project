// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_wrapper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseWrapper _$CharacterResponseWrapperFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseWrapper(
      results: (json['results'] as List<dynamic>)
          .map(
              (e) => CharacterResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterResponseWrapperToJson(
        CharacterResponseWrapper instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
