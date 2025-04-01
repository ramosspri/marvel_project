import 'package:flutter/material.dart';
import '../../domain/entity/character_entity.dart';

class CharacterDetailsMainContent extends StatelessWidget {
  const CharacterDetailsMainContent({super.key, required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Image.network(character.thumbnailUrl,
              width: double.infinity, height: 375, fit: BoxFit.cover),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black87, Colors.transparent]))))
        ]),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(character.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 16),
              const Text('Biography',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 8),
              Text(
                  character.description.isNotEmpty
                      ? character.description
                      : 'No description available',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            ]))
      ]));
}
