import 'package:card_dex/models/pokemon_card.dart';
import 'package:flutter/material.dart';

class CardGridItem extends StatelessWidget {
  final PokemonCard card;
  final VoidCallback? onTap;

  const CardGridItem({super.key, required this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey('card-${card.id}'),
      child: Material(
        child: Ink.image(
          onImageError: (exception, stackTrace) {
            debugPrint(exception.toString());
          },
          image: NetworkImage(
            card.images['small']!,
          ),
          fit: BoxFit.cover,
          child: InkWell(onTap: onTap),
        ),
      ),
    );
  }
}
