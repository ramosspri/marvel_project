import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/injection/core_dependency_injection.dart';
import 'features/characters/presentation/characters.page.dart';

void main() async {
  await dotenv.load(
      fileName: '/Users/priscila.oliveira/Projetos/marvel_project/.env');

  await CoreDependencyInjection.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(useMaterial3: true), home: const CharactersPage());
}
