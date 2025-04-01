import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

import '../../../../core/network/core_network_info.dart';
import '../../domain/entity/character_entity.dart';
import '../../domain/entity/character_request_entity.dart';
import '../../domain/repository/characters_repository_interface.dart';
import '../datasource/characters_datasource_remote.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  CharactersRepository() {
    datasource = CharactersDatasourceRemote(dio);
  }

  final Dio dio = Dio(BaseOptions(baseUrl: 'https://gateway.marvel.com'));

  late final CharactersDatasourceRemote datasource;
  CoreNetworkInfo networkInfo = CoreNetworkInfo();

  @override
  Future<List<CharacterEntity>> getCharacters(
      CharacterRequestEntity entity, int offset) async {
    final bool hasConnection = await networkInfo.checkConnectivity();

    if (hasConnection) {
      try {
        final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        final apiKey = dotenv.env['MARVEL_PUBLIC_KEY'] ?? '';
        final privateKey = dotenv.env['MARVEL_PRIVATE_KEY'] ?? '';

        if (apiKey.isEmpty || privateKey.isEmpty) {
          throw Exception(
              'Chaves da API não configuradas corretamente no .env');
        }

        final hash =
            md5.convert(utf8.encode('$timestamp$privateKey$apiKey')).toString();

        final response = await datasource.getCharacters(
            timestamp, apiKey, hash, 10, entity.offset ?? 0);
        debugPrint('Response: $response');

        return response.results
            .map((model) => CharacterEntity(
                  id: model.id,
                  name: model.name,
                  description: model.description,
                  thumbnailUrl:
                      '${model.thumbnailPath}.${model.thumbnailExtension}',
                  storiesAvailable: model.storiesAvailable,
                ))
            .toList();
      } on DioException catch (error) {
        throw Exception(_handleDioError(error));
      }
    }

    throw Exception('Erro desconhecido:}');
  }

  String _handleDioError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode ?? 'N/A';
    final errorMessage = response?.data['message'] ?? 'Erro desconhecido';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tempo limite de conexão excedido';
      case DioExceptionType.sendTimeout:
        return 'Tempo limite ao enviar os dados';
      case DioExceptionType.receiveTimeout:
        return 'Tempo limite ao receber os dados';
      case DioExceptionType.badResponse:
        return 'Erro no servidor ($statusCode): $errorMessage';
      case DioExceptionType.cancel:
        return 'Requisição cancelada';
      case DioExceptionType.connectionError:
        return 'Erro de conexão. Verifique sua internet';
      default:
        return 'Erro inesperado';
    }
  }
}
