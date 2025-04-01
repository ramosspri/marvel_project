// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterRequestModel _$CharacterRequestModelFromJson(
        Map<String, dynamic> json) =>
    CharacterRequestModel(
      apiKey: json['api_key'] as String,
      ts: json['ts'] as String,
      hash: json['hash'] as String,
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CharacterRequestModelToJson(
        CharacterRequestModel instance) =>
    <String, dynamic>{
      'api_key': instance.apiKey,
      'ts': instance.ts,
      'hash': instance.hash,
      'limit': instance.limit,
    };
