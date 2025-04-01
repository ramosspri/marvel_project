// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnailPath: json['thumbnailPath'] as String,
      thumbnailExtension: json['thumbnailExtension'] as String,
      storiesAvailable: (json['stories'] as num).toInt(),
    );

Map<String, dynamic> _$CharacterResponseModelToJson(
        CharacterResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnailPath': instance.thumbnailPath,
      'thumbnailExtension': instance.thumbnailExtension,
      'stories': instance.storiesAvailable,
    };
