import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/provider/pokemon_provider.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          'Pokédex',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pokemonData = ref.watch(pokemonProvider);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search Pokemon',
                    ),
                  ),
                ),
                Container(
                  child: pokemonData.pokemon.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : GridView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: pokemonData.pokemon.length,
                          itemBuilder: (context, index) {
                            final pokemon = pokemonData.pokemon[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: pokemon.type == 'grass'
                                      ? Colors.green.shade300
                                      : pokemon.type == 'fire'
                                          ? Colors.red.shade400
                                          : pokemon.type == 'water'
                                              ? Colors.blue.shade300
                                              : pokemon.type == 'bug'
                                                  ? Colors.green
                                                  : pokemon.type == 'flying'
                                                      ? Colors.blueAccent
                                                      : pokemon.type == 'rock'
                                                          ? Colors.brown
                                                          : pokemon.type ==
                                                                  'Ground'
                                                              ? Colors.grey
                                                              : pokemon.type ==
                                                                      'normal'
                                                                  ? Colors
                                                                      .black26
                                                                  : pokemon.type ==
                                                                          'ghost'
                                                                      ? Colors
                                                                          .indigo
                                                                      : pokemon.type ==
                                                                              'electric'
                                                                          ? Colors
                                                                              .deepOrange
                                                                          : pokemon.type == 'psychic'
                                                                              ? Colors.purple
                                                                              : pokemon.type == 'poison'
                                                                                  ? Colors.deepPurpleAccent
                                                                                  : Colors.pink,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Image.network(
                                        'https://cdn-icons-png.flaticon.com/512/1068/1068729.png',
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                    Positioned(
                                        right: 10,
                                        bottom: 40,
                                        child: Image.network(
                                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                                              pokemon.id.toString() +
                                              '.png',
                                          fit: BoxFit.cover,
                                          height: 130,
                                          width: 120,
                                        )),
                                    Positioned(
                                      bottom: 40,
                                      left: 10,
                                      child: Text(
                                        pokemon.name.toCapitalized(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 100,
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          pokemon.type.toCapitalized(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
