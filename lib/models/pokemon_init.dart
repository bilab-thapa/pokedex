import 'package:pokedex/models/pokemon.dart';

class PokemonState {
  List<Pokemon> pokemon;
  String searchText;

  PokemonState({
    required this.pokemon,
    required this.searchText,
  });

  PokemonState.initState()
      : pokemon = [],
        searchText = '';

  PokemonState copyWith({List<Pokemon>? pokemon, String? searchText}) {
    return PokemonState(
      pokemon: pokemon ?? this.pokemon,
      searchText: searchText ?? this.searchText,
    );
  }
}
