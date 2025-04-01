import 'package:flutter/material.dart';

import '../../../../shared/path/assets_path_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/characters_cubit.dart';
import '../cubit/characters_state.dart';
import '../widgets/characters_mainContent_widget.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<CharactersCubit>().loadMoreCharacters();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF202020),
          title:
              Image.asset(AssetsPathImages.marvelLogo, height: 40, width: 98)),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) => Stack(children: [
                SingleChildScrollView(
                    controller: _scrollController,
                    child: const CharactersMainContentWidget()),
                if (state is Loading)
                  const Center(child: CircularProgressIndicator())
              ])));
}
