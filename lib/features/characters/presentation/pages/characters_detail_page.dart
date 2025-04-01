import 'package:flutter/material.dart';

import '../../../../shared/path/assets_path_images.dart';
import '../../domain/entity/character_entity.dart';
import '../widgets/characters_detail_mainContent_widget.dart';

class CharactersDetailPage extends StatelessWidget {
  const CharactersDetailPage({
    required this.character,
    super.key,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
              color: const Color(0xFFFFFFFF)),
          centerTitle: true,
          backgroundColor: const Color(0xFF202020),
          title:
              Image.asset(AssetsPathImages.marvelLogo, height: 40, width: 98)),
      body: CharacterDetailsMainContent(character: character));
}
