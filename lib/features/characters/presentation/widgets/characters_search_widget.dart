import 'package:flutter/material.dart';

class CharactersSearchWidget extends StatefulWidget {
  const CharactersSearchWidget({super.key, required this.onSearchChanged});

  final Function(String)? onSearchChanged;

  @override
  State<CharactersSearchWidget> createState() => _CharactersSearchWidgetState();
}

class _CharactersSearchWidgetState extends State<CharactersSearchWidget> {
  @override
  Widget build(BuildContext context) => TextField(
      onChanged: widget.onSearchChanged,
      decoration: const InputDecoration(
          hintText: 'Search characters',
          hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
              fontSize: 13),
          prefixIcon: Icon(Icons.search),
          border: UnderlineInputBorder()));
}
