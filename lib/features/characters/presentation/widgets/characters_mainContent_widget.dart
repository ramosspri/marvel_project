import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/assets/widgets/card_widget.dart';
import '../../../../shared/assets/widgets/carousel_timer_widget.dart';
import '../../domain/entity/character_entity.dart';
import '../cubit/characters_cubit.dart';
import '../cubit/characters_state.dart';
import '../pages/characters_detail_page.dart';
import 'characters_search_widget.dart';

class CharactersMainContentWidget extends StatefulWidget {
  const CharactersMainContentWidget({super.key});

  @override
  State<CharactersMainContentWidget> createState() =>
      _CharactersMainContentWidgetState();
}

class _CharactersMainContentWidgetState
    extends State<CharactersMainContentWidget> {
  late CharactersCubit charactersCubit;

  double size24px = 24;
  TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.w700, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    charactersCubit = context.read<CharactersCubit>();

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size24px, vertical: size24px),
        child: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
          if (state is ErrorGetCharacters) {
            return Center(child: Text(state.message));
          }
          if (state is SuccessGetCharacters) {
            List<CharacterEntity> featuredCharacters = charactersCubit
                .listCharacters
                .where((character) => character.storiesAvailable > 30)
                .toList()
              ..shuffle();

            featuredCharacters = featuredCharacters.take(5).toList();

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FEATURED CHARACTERS', style: textStyle),
                  Padding(
                      padding: const EdgeInsets.all(24),
                      child: CarouselTimerWidget(
                          cards: featuredCharacters
                              .map((character) => CharacterCard(
                                  onTap: () => _redirectToCharacterDetailsPage(
                                      context, character),
                                  imageUrl: character.thumbnailUrl,
                                  name: character.name,
                                  isFeatured: true))
                              .toList())),
                  SizedBox(height: size24px),
                  CharactersSearchWidget(
                      onSearchChanged: (query) =>
                          charactersCubit.searchCharacters(query)),
                  SizedBox(height: size24px),
                  Text('MARVEL CHARACTERS LIST', style: textStyle),
                  SizedBox(height: size24px),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.8),
                      itemCount:
                          state.characters.length + (state is Loading ? 1 : 0),
                      itemBuilder: (context, index) {
                        final character = state.characters[index];

                        return CharacterCard(
                            onTap: () => _redirectToCharacterDetailsPage(
                                context, character),
                            imageUrl: character.thumbnailUrl,
                            name: character.name,
                            isFeatured: false);
                      })
                ]);
          }
          return Container();
        }));
  }

  _redirectToCharacterDetailsPage(
      BuildContext context, CharacterEntity character) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharactersDetailPage(character: character)));
  }
}
