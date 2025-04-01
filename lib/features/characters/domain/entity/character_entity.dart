class CharacterEntity {
  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      CharacterEntity(
          id: json['id'],
          name: json['name'],
          description: json['description'] ?? 'Sem descrição disponível.',
          thumbnailUrl:
              "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
          storiesAvailable: json['stories']['available']);

  CharacterEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.storiesAvailable,
  });

  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final int storiesAvailable;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': {
          'path': thumbnailUrl.split('.').first,
          'extension': thumbnailUrl.split('.').last
        },
        'stories': {'available': storiesAvailable}
      };
}
