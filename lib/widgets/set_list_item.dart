import 'package:card_dex/models/pokemon_card_set.dart';
import 'package:flutter/material.dart';

class SetListItem extends StatelessWidget {
  final Widget? trailing;
  final VoidCallback? onTap;
  final PokemonCardSet set;

  const SetListItem({super.key, required this.set, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      onTap: onTap,
      subtitleTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.primary),
      title: Text(set.name),
      subtitle: Text(set.series),
      leading: Hero(
        tag: 'set-${set.id}',
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              set.images['symbol']!,
            ),
          ),
        ),
      ),
    );
  }
}
