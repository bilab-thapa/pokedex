import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/models/pokemon_init.dart';
import 'package:pokedex/services/pokemon_service.dart';

final pokemonProvider = StateNotifierProvider<PokemonProvider, PokemonState>(
    (ref) => PokemonProvider());

class PokemonProvider extends StateNotifier<PokemonState> {
  PokemonProvider() : super(PokemonState.initState()) {
    getData();
  }

  Future<void> getData() async {
    final response = await PokemonService.getPokemon();

    state = state.copyWith(pokemon: response);
  }
}
