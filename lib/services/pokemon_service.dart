import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:collection/collection.dart';

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
      {required String searchText, required int id}) async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseUrl);
      final data = (response.data as List)
          .map((e) => Pokemon.fromJson(e))
          .whereNotNull()
          .toList();
      return data;
    } on DioError {
      return [];
    }
  }
}
