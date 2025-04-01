import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.imageUrl,
    required this.name,
    required this.onTap,
    this.isFeatured = false,
    super.key,
  });

  final String imageUrl;
  final String name;
  final bool isFeatured;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: SizedBox(
                width: isFeatured ? 180 : 156,
                height: isFeatured ? 180 : 156,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Positioned.fill(
                          child: imageUrl.isNotEmpty
                              ? Image.network(imageUrl, fit: BoxFit.cover)
                              : const Icon(Icons.person,
                                  size: 50, color: Colors.grey)),
                      Container(
                          width: double.infinity,
                          color: Colors.black.withAlpha(70),
                          padding: const EdgeInsets.all(8),
                          child: Text(name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                    ])))),
      );
}
