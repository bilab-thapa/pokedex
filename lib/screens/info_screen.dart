import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/screens/display.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String name = data[1];
    String type = data[2];
    String desc = data[3];
    int attack = data[4];
    int defence = data[5];
    int height = data[6];
    int weight = data[7];
    int id = data[0];

    //String desc = data[3];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: type == 'grass'
            ? Colors.green.shade300
            : type == 'fire'
                ? Colors.red
                : type == 'water'
                    ? Colors.blue.shade300
                    : type == 'bug'
                        ? Colors.green
                        : type == 'flying'
                            ? Colors.blueAccent
                            : type == 'rock'
                                ? Colors.brown
                                : type == 'ground'
                                    ? Colors.brown.shade300
                                    : type == 'normal'
                                        ? Colors.black26
                                        : type == 'ghost'
                                            ? Colors.indigo
                                            : type == 'electric'
                                                ? Colors.amber
                                                : type == 'psychic'
                                                    ? Colors.purple
                                                    : type == 'poison'
                                                        ? Colors
                                                            .deepPurpleAccent
                                                        : type == 'fighting'
                                                            ? Colors.indigo
                                                            : type == 'ice'
                                                                ? Colors
                                                                    .tealAccent
                                                                : Colors.pink,
        title: const Text('Pokémon'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name.toCapitalized(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                        id.toString() +
                        '.png',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: type == 'grass'
                          ? Colors.green.shade300
                          : type == 'fire'
                              ? Colors.red
                              : type == 'water'
                                  ? Colors.blue.shade300
                                  : type == 'bug'
                                      ? Colors.green
                                      : type == 'flying'
                                          ? Colors.blueAccent
                                          : type == 'rock'
                                              ? Colors.brown
                                              : type == 'ground'
                                                  ? Colors.brown.shade300
                                                  : type == 'normal'
                                                      ? Colors.black26
                                                      : type == 'ghost'
                                                          ? Colors.indigo
                                                          : type == 'electric'
                                                              ? Colors.amber
                                                              : type ==
                                                                      'psychic'
                                                                  ? Colors
                                                                      .purple
                                                                  : type ==
                                                                          'poison'
                                                                      ? Colors
                                                                          .deepPurpleAccent
                                                                      : type ==
                                                                              'fighting'
                                                                          ? Colors
                                                                              .indigo
                                                                          : type == 'ice'
                                                                              ? Colors.tealAccent
                                                                              : Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 40,
                    width: 120,
                    child: Text(
                      type.toCapitalized(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: -80,
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: type == 'grass'
                          ? Colors.green.shade300
                          : type == 'fire'
                              ? Colors.red
                              : type == 'water'
                                  ? Colors.blue.shade300
                                  : type == 'bug'
                                      ? Colors.green
                                      : type == 'flying'
                                          ? Colors.blueAccent
                                          : type == 'rock'
                                              ? Colors.brown
                                              : type == 'ground'
                                                  ? Colors.brown.shade300
                                                  : type == 'normal'
                                                      ? Colors.black26
                                                      : type == 'ghost'
                                                          ? Colors.indigo
                                                          : type == 'electric'
                                                              ? Colors.amber
                                                              : type ==
                                                                      'psychic'
                                                                  ? Colors
                                                                      .purple
                                                                  : type ==
                                                                          'poison'
                                                                      ? Colors
                                                                          .deepPurpleAccent
                                                                      : type ==
                                                                              'fighting'
                                                                          ? Colors
                                                                              .indigo
                                                                          : type == 'ice'
                                                                              ? Colors.tealAccent
                                                                              : Colors.pink,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                              0.0, 1.0), // shadow direction: bottom right
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          desc,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Attack'),
                            Text(attack.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Defence'),
                            Text(defence.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Height'),
                            Text(height.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Weight'),
                            Text(weight.toString() + 'Kg')
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
