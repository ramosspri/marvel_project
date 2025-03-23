import 'package:flutter/material.dart';

import '../../../shared/path/assets_path_images.dart';
import 'widgets/characters_mainContent_widget.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF202020),
          title:
              Image.asset(AssetsPathImages.marvelLogo, height: 40, width: 98)),
      body: const CharactersMainContentWidget());
}
