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
    int id = data[0];

    //String desc = data[3];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pokémon'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
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
                        fontSize: 30, fontWeight: FontWeight.bold),
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
                                ? Colors.red.shade400
                                : type == 'water'
                                    ? Colors.blue.shade300
                                    : type == 'bug'
                                        ? Colors.green
                                        : type == 'flying'
                                            ? Colors.blueAccent
                                            : type == 'rock'
                                                ? Colors.brown
                                                : type == 'Ground'
                                                    ? Colors.grey
                                                    : type == 'normal'
                                                        ? Colors.black26
                                                        : type == 'ghost'
                                                            ? Colors.indigo
                                                            : type == 'electric'
                                                                ? Colors
                                                                    .deepOrange
                                                                : type ==
                                                                        'psychic'
                                                                    ? Colors
                                                                        .purple
                                                                    : type ==
                                                                            'poison'
                                                                        ? Colors
                                                                            .deepPurpleAccent
                                                                        : Colors
                                                                            .pink,
                        borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                              1.0, 1.0), // shadow direction: bottom right
                        ),
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          desc,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
