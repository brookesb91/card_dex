class PokemonAbility {
  final String name;
  final String text;
  final String type;

  PokemonAbility({
    required this.name,
    required this.text,
    required this.type,
  });

  PokemonAbility.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        text = json['text'],
        type = json['type'];
}
