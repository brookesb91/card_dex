import 'dart:convert';

import 'package:card_dex/models/pokemon_card_set.dart';
import 'package:flutter/services.dart';

class SetRepository {
  Future<List<PokemonCardSet>> list() {
    return rootBundle.loadStructuredData<List<dynamic>>('data/sets/en.json',
        (data) {
      return Future.value(jsonDecode(data));
    }).then((data) => data.map((e) => PokemonCardSet.fromJson(e)).toList());
  }
}
