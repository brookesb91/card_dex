class PokemonCardSet {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Map<String, String> legalities;
  final String? ptcgoCode;
  final String releaseDate;
  final Map<String, String> images;

  PokemonCardSet({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.images,
  });

  PokemonCardSet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        series = json['series'],
        printedTotal = json['printedTotal'],
        total = json['total'],
        legalities = Map<String, String>.from(json['legalities']),
        ptcgoCode = json['ptcgoCode'],
        releaseDate = json['releaseDate'],
        images = Map<String, String>.from(json['images']);
}
