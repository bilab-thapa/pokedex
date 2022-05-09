import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/models/pokemon_init.dart';
import 'package:pokedex/services/pokemon_service.dart';

import '../models/pokemon.dart';

final pokemonProvider = StateNotifierProvider<PokemonProvider, PokemonState>(
    (ref) => PokemonProvider());

class PokemonProvider extends StateNotifier<PokemonState> {
  PokemonProvider() : super(PokemonState.initState()) {
    getData();
  }

  Future<void> getData() async {
    List<Pokemon> _pokemon = [];
    if (state.searchText.isEmpty) {
      final response = await PokemonService.getPokemon();
      state = state.copyWith(pokemon: response);
    } else {
      _pokemon =
          await PokemonService.searchPokemon(searchText: state.searchText);
    }

    state = state.copyWith(pokemon: [...state.pokemon, ..._pokemon]);
  }

  void searchPokemon(String query) {
    state = state.copyWith(
      searchText: query,
      pokemon: [],
    );
    getData();
  }
}
