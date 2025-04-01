import 'package:json_annotation/json_annotation.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  CharacterResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.thumbnailExtension,
    required this.storiesAvailable,
  });

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      CharacterResponseModel(
        id: (json['id'] as num?)?.toInt() ?? 0,
        name: json['name'] as String? ?? '',
        description: json['description'] as String? ?? '',
        thumbnailPath: json['thumbnail']?['path'] as String? ?? '',
        thumbnailExtension: json['thumbnail']?['extension'] as String? ?? '',
        storiesAvailable: (json['stories']?['available'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);

  final int id;
  final String name;
  final String description;
  final String thumbnailPath;
  final String thumbnailExtension;

  @JsonKey(name: 'stories')
  final int storiesAvailable;

  String get thumbnailUrl => '$thumbnailPath.$thumbnailExtension';

  bool get isFeatured => storiesAvailable > 20;
}
