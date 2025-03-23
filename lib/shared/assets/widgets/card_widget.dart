import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    this.isFeatured = false,
  });

  final String imageUrl;
  final String name;
  final bool isFeatured;

  @override
  Widget build(BuildContext context) => Container(
      width: isFeatured ? 140 : double.infinity, // Largura menor para carrossel
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: isFeatured
              ? Border.all(color: Colors.blue, width: 2)
              : null, // Destaque com borda
          boxShadow: [
            const BoxShadow(color: Colors.black, blurRadius: 4, spreadRadius: 1)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(imageUrl,
                width: double.infinity,
                height: isFeatured ? 160 : 120, // Maior para featured
                fit: BoxFit.cover),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ])));
}
