// import 'package:card_dex/models/pokemon_ability.dart';
// import 'package:card_dex/models/pokemon_attack.dart';
// import 'package:card_dex/models/pokemon_multiplier.dart';

class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  final List<String>? subtypes;
  final List<String>? rules;
  final String? level;
  final String? hp;
  final List<String>? types;
  final String? evolvesFrom;
  // final List<PokemonAbility>? abilities;
  // final List<PokemonAttack>? attacks;
  // final List<PokemonMultiplier>? weaknesses;
  // final List<PokemonMultiplier>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final String number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  // final List<int>? nationalPokedexNumbers;
  final Map<String, String> legalities;
  final Map<String, String> images;

  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.level,
    required this.hp,
    required this.types,
    required this.evolvesFrom,
    required this.rules,
    // required this.abilities,
    // required this.attacks,
    // required this.weaknesses,
    // required this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.flavorText,
    // required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
  });

  PokemonCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        supertype = json['supertype'],
        subtypes = json['subtypes']?.cast<String>(),
        level = json['level'],
        hp = json['hp'],
        types = json['types']?.cast<String>(),
        evolvesFrom = json['evolvesFrom'],
        rules = json['rules']?.cast<String>(),
        // abilities = json['abilities']
        //     ?.map((e) => PokemonAbility.fromJson(e))
        //     .toList<PokemonAbility>(),
        // attacks = (json['attacks'] ?? [].map((e) => PokemonAttack.fromJson(e)))
        //     .toList<PokemonAttack>(),
        // weaknesses = (json['weaknesses'] ?? [])
        //     .map((e) => PokemonMultiplier.fromJson(e))
        //     .toList<PokemonMultiplier>(),
        // resistances = List.from(json['resistances'] ?? [])
        //     .map((e) => PokemonMultiplier.fromJson(e))
        //     .toList(),
        retreatCost = json['retreatCost']?.cast<String>(),
        convertedRetreatCost = json['convertedRetreatCost'],
        number = json['number'],
        artist = json['artist'],
        rarity = json['rarity'],
        flavorText = json['flavorText'],
        // nationalPokedexNumbers =
        //     List.from(json['nationalPokedexNumbers'] ?? []),
        legalities = Map<String, String>.from(json['legalities']),
        images = Map<String, String>.from(json['images']);
}
