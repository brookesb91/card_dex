import 'dart:convert';
import 'package:card_dex/models/pokemon_card.dart';
import 'package:flutter/services.dart';

class CardRepository {
  Future<List<PokemonCard>> list(String set) {
    return rootBundle
        .loadStructuredData<List<dynamic>>('data/cards/en/$set.json', (data) {
      return Future.value(jsonDecode(data));
    }).then((data) => data.map((e) => PokemonCard.fromJson(e)).toList());
  }
}
