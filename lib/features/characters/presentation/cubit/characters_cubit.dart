import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../domain/entity/character_entity.dart';
import '../../domain/entity/character_request_entity.dart';
import '../../domain/usecase/characters_getList_usecase.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(InitialState()) {
    init();
  }

  final CharactersGetListUsecase _charactersGetListUsecase =
      CharactersGetListUsecase();

  int _currentPage = 0;
  static const int _limit = 10;

  List<CharacterEntity> listCharacters = <CharacterEntity>[];
  List<CharacterEntity> _filteredCharacters = <CharacterEntity>[];

  void init() {
    debugPrint('Cubit initialized');
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final apiKey = dotenv.env['MARVEL_PUBLIC_KEY'] ?? '';
    final privateKey = dotenv.env['MARVEL_PRIVATE_KEY'] ?? '';

    final hash =
        md5.convert(utf8.encode('$timestamp$privateKey$apiKey')).toString();

    final requestEntity = CharacterRequestEntity(
        apiKey: apiKey, timestamp: timestamp, hash: hash, limit: 10);

    getCharacters(requestEntity);
  }

  Future<void> loadMoreCharacters() async {
    if (state is LoadMoreCharacters) return;

    emit(LoadMoreCharacters());

    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final apiKey = dotenv.env['MARVEL_PUBLIC_KEY'] ?? '';
    final privateKey = dotenv.env['MARVEL_PRIVATE_KEY'] ?? '';

    final hash =
        md5.convert(utf8.encode('$timestamp$privateKey$apiKey')).toString();

    final requestEntity = CharacterRequestEntity(
        apiKey: apiKey,
        timestamp: timestamp,
        hash: hash,
        limit: _limit,
        offset: _currentPage * _limit);

    final List<CharacterEntity> response =
        await _charactersGetListUsecase.call(requestEntity);

    if (response.isNotEmpty) {
      listCharacters.addAll(response);
      _currentPage++;

      emit(SuccessGetCharacters(characters: List.from(listCharacters)));
    } else {
      emit(ErrorGetCharacters(message: 'Error while getting characters'));
    }
  }

  Future<void> getCharacters(CharacterRequestEntity requestEntity) async {
    debugPrint('Estado emitido: CharactersLoading');

    final List<CharacterEntity> response =
        await _charactersGetListUsecase.call(requestEntity);

    if (response.isNotEmpty) {
      listCharacters.addAll(response);
      _currentPage++;

      return emit(SuccessGetCharacters(characters: listCharacters));
    } else {
      return emit(
          ErrorGetCharacters(message: 'Error while getting characters'));
    }
  }

  void searchCharacters(String query) {
    if (query.isEmpty) {
      _filteredCharacters = List.from(listCharacters);
    } else {
      _filteredCharacters = listCharacters
          .where((character) =>
              character.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SuccessGetCharacters(characters: _filteredCharacters));
  }
}
