import 'package:pokedex/api.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonState {
  List<Pokemon> pokemon;
  String searchText;
  String apiPath;

  PokemonState({
    required this.pokemon,
    required this.searchText,
    required this.apiPath,
  });

  PokemonState.initState()
      : pokemon = [],
        searchText = '',
        apiPath = Api.baseUrl;

  PokemonState copyWith({List<Pokemon>? pokemon, String? searchText}) {
    return PokemonState(
        pokemon: pokemon ?? this.pokemon,
        searchText: searchText ?? this.searchText,
        apiPath: apiPath);
  }
}
