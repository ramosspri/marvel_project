import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/characters/presentation/pages/characters_page.dart';
import 'features/characters/presentation/cubit/characters_cubit.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider<CharactersCubit>(
          create: (_) => CharactersCubit(), child: const CharactersPage()));
}
