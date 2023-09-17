import 'package:card_dex/models/pokemon_card.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final List<PokemonCard> cards;
  final int index;

  const CardPage({super.key, this.cards = const [], this.index = 0});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: widget.index, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
          controller: _controller,
          itemCount: widget.cards.length,
          itemBuilder: (context, index) {
            final card = widget.cards[index];
            return Center(
              child: Hero(
                tag: ValueKey('card-${card.id}'),
                child: AspectRatio(
                  aspectRatio: 240 / 330,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      card.images['large']!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress?.cumulativeBytesLoaded ==
                            loadingProgress?.expectedTotalBytes) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress!.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
