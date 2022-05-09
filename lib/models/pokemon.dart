class Pokemon {
  final String name;
  final String imgUrl;
  final String type;
  final int id;
  final String desc;

  Pokemon({
    required this.name,
    required this.imgUrl,
    required this.type,
    required this.id,
    required this.desc,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      desc: json['description'] ?? '',
    );
  }
}
