import 'dart:convert';
import 'package:card_dex/models/pokemon_card.dart';
import 'package:flutter/services.dart';

class CardRepository {
  final Map<String, List<PokemonCard>> _cache = {};

  Future<List<PokemonCard>> list(String set) {
    if (_cache.containsKey(set)) {
      return Future.value(_cache[set]);
    }

    return rootBundle
        .loadStructuredData<List<dynamic>>('data/cards/en/$set.json', (data) {
          return Future.value(jsonDecode(data));
        })
        .then((data) => data.map((e) => PokemonCard.fromJson(e)).toList())
        .then((data) {
          _cache[set] = data;
          return data;
        });
  }
}
