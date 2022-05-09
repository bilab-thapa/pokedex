import 'package:dio/dio.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonService {
  static Future<List<Pokemon>> getPokemon() async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseUrl);
      final data = (response.data as List)
          .where((data) => data != null)
          .map((e) => Pokemon.fromJson(e))
          .toList();
      return data;

      // data.removeAt(0);
    } on DioError {
      return [];
    }
  }

  static Future<List<Pokemon>> searchPokemon(
      {required String searchText}) async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseUrl, queryParameters: {
        'query': searchText,
      });
      if ((response.data as List).isEmpty) {
        return [
          Pokemon(
            name: 'Not Found', imgUrl: '', type: '', id: 0, desc: '',
            // desc: '',
          ),
        ];
      } else {
        final data = (response.data as List)
            .where((data) => data != null)
            .map((e) => Pokemon.fromJson(e))
            .toList();
        return data;
      }
    } on DioError {
      return [];
    }
  }
}
