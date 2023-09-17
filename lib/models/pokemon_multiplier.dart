class PokemonMultiplier {
  final String type;
  final String value;

  PokemonMultiplier({
    required this.type,
    required this.value,
  });

  PokemonMultiplier.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        value = json['value'];
}
