class CharacterEntity {
  CharacterEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnailUrl});

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    final thumbnail = json['thumbnail'];
    return CharacterEntity(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnailUrl: '${thumbnail['path']}.${thumbnail['extension']}');
  }

  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': thumbnailUrl
      };
}
