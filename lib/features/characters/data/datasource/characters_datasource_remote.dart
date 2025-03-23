import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CharactersDatasourceRemote {
  final String baseUrl = 'https://gateway.marvel.com/v1/public/characters';
  final String publicKey = dotenv.env['MARVEL_PUBLIC_KEY'] ?? '';
  final String privateKey = dotenv.env['MARVEL_PRIVATE_KEY'] ?? '';

  String _generateHash(String timestamp) {
    var input = timestamp + privateKey + publicKey;
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<List<dynamic>> getCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timestamp);
    final url = '$baseUrl?ts=$timestamp&apikey=$publicKey&hash=$hash';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['results'];
    } else {
      throw Exception('Erro ao buscar personagens');
    }
  }
}
