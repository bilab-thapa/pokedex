class Pokemon {
  final String name;
  final String imgUrl;
  final String type;
  final int id;
  final String desc;
  final int weight;
  final int height;
  final int attack;
  final int defence;

  Pokemon({
    required this.name,
    required this.imgUrl,
    required this.type,
    required this.id,
    required this.desc,
    required this.weight,
    required this.height,
    required this.attack,
    required this.defence,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      desc: json['description'] ?? '',
      weight: json['weight'] ?? '',
      height: json['height'] ?? '',
      attack: json['attack'] ?? '',
      defence: json['defence'] ?? '',
    );
  }
}
