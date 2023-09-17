class PokemonAttack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  PokemonAttack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  PokemonAttack.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        cost = json['cost'].cast<String>(),
        convertedEnergyCost = json['convertedEnergyCost'],
        damage = json['damage'],
        text = json['text'];
}
