import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:get/get.dart';
import 'package:pokedex/screens/info_screen.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final node = FocusNode();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
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
                        controller: searchController,
                        onFieldSubmitted: (val) {
                          ref.read(pokemonProvider.notifier).searchPokemon(val);
                          searchController.clear();
                        },
                        focusNode: FocusNode(canRequestFocus: false),
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
                          : pokemonData.pokemon[0].name == 'No Name'
                              ? SizedBox(
                                  height: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Try to use correct names'),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          ref.refresh(pokemonProvider.notifier);
                                        },
                                        child: const Text('Reload'),
                                      )
                                    ],
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
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => const InfoScreen(),
                                            arguments: [
                                              pokemon.id,
                                              pokemon.name,
                                              pokemon.type,
                                              pokemon.desc
                                            ],
                                            transition: Transition.leftToRight);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
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
                                                            : pokemon.type ==
                                                                    'flying'
                                                                ? Colors
                                                                    .blueAccent
                                                                : pokemon.type ==
                                                                        'rock'
                                                                    ? Colors
                                                                        .brown
                                                                    : pokemon.type ==
                                                                            'Ground'
                                                                        ? Colors
                                                                            .grey
                                                                        : pokemon.type ==
                                                                                'normal'
                                                                            ? Colors.black26
                                                                            : pokemon.type == 'ghost'
                                                                                ? Colors.indigo
                                                                                : pokemon.type == 'electric'
                                                                                    ? Colors.deepOrange
                                                                                    : pokemon.type == 'psychic'
                                                                                        ? Colors.purple
                                                                                        : pokemon.type == 'poison'
                                                                                            ? Colors.deepPurpleAccent
                                                                                            : Colors.pink,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                  right: 15,
                                                  top: 10,
                                                  child: Text(
                                                    pokemon.id.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.white),
                                                  )),
                                              Positioned(
                                                right: 15,
                                                bottom: 40,
                                                child: Image.network(
                                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                                                      pokemon.id.toString() +
                                                      '.png',
                                                  fit: BoxFit.cover,
                                                  height: 130,
                                                  width: 120,
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                left: 10,
                                                child: Text(
                                                  pokemon.name.toCapitalized(),
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    pokemon.type
                                                        .toCapitalized(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
        ),
      );
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
