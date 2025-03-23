import 'package:flutter/material.dart';

import '../../../../shared/assets/widgets/card_widget.dart';
import '../../../../shared/assets/widgets/carousel_timer_widget.dart';
import '../../../../shared/path/assets_path_images.dart';

class CharactersMainContentWidget extends StatefulWidget {
  const CharactersMainContentWidget({super.key});

  @override
  State<CharactersMainContentWidget> createState() =>
      _CharactersMainContentWidgetState();
}

class _CharactersMainContentWidgetState
    extends State<CharactersMainContentWidget> {
  final featuredCharacters = [];

  double size24px = 24;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: size24px, vertical: size24px),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: const Text('FEATURED CHARACTERS',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
            const SizedBox(height: 16),
            const Expanded(
                child: Stack(
              children: [
                CarouselTimerWidget(
                  cards: [
                    CharacterCard(
                        imageUrl: AssetsPathImages.marvelLogo,
                        name: 'Viúva Negra',
                        isFeatured: true),
                    CharacterCard(
                        imageUrl: AssetsPathImages.marvelLogo,
                        name: 'Hulk',
                        isFeatured: true),
                    CharacterCard(
                        imageUrl: AssetsPathImages.marvelLogo,
                        name: 'Capitão América',
                        isFeatured: true),
                  ],
                )
              ],
            )),
            SizedBox(height: size24px),
            Container(
                child: const Text('MARVEL CHARACTERS LIST',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
            SizedBox(height: size24px),
            Container(
                child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'Search characters',
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder()))),
            SizedBox(height: size24px),
            Expanded(
                child: Container(
                    height: 180,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.8),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) => const CharacterCard(
                            imageUrl: AssetsPathImages.marvelLogo,
                            name: 'Viúva Negra',
                            isFeatured: true)))),
          ]));
}
