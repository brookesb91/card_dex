import 'dart:async';

import 'package:card_dex/models/pokemon_card.dart';
import 'package:card_dex/models/pokemon_card_set.dart';
import 'package:card_dex/pages/card_page.dart';
import 'package:card_dex/repositories/card_repository.dart';
import 'package:card_dex/widgets/card_grid_item.dart';
import 'package:card_dex/widgets/set_list_item.dart';
import 'package:flutter/material.dart';

class CardSearchDelegate extends SearchDelegate {
  final List<PokemonCard> cards;
  final void Function(PokemonCard card, int index) onTap;

  CardSearchDelegate({required this.cards, required this.onTap});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _build(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    final results = query.isEmpty
        ? List<(int, PokemonCard)>.empty()
        : cards.indexed.where((item) {
            return item.$2.name.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return ListView(
      children: results.map((e) {
        final index = e.$1;
        final card = e.$2;

        return ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.network(card.images['small']!),
          ),
          title: Text(card.name),
          onTap: () => onTap.call(card, index),
        );
      }).toList(),
    );
  }
}

class SetPage extends StatefulWidget {
  final PokemonCardSet set;

  const SetPage({super.key, required this.set});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  final CardRepository _repository = CardRepository();
  final ScrollController _scrollController = ScrollController();

  List<PokemonCard> _cards = [];
  StreamSubscription? _subscription;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() {
    _subscription?.cancel();

    _isLoading = true;

    _subscription = _repository.list(widget.set.id).asStream().listen((cards) {
      setState(() {
        _cards = cards;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar.large(
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CardSearchDelegate(
                          cards: _cards,
                          onTap: (card, index) {
                            _showCard(context, index);
                          }));
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              centerTitle: true,
              title: Image.network(
                widget.set.images['logo']!,
                height: 32,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverList.list(children: [SetListItem(set: widget.set)]),
          if (!_isLoading)
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverLayoutBuilder(builder: (context, constraints) {
                return SliverGrid.count(
                  crossAxisCount: 1 + (constraints.crossAxisExtent ~/ 240),
                  childAspectRatio: 240 / 330,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: _cards
                      .asMap()
                      .entries
                      .map(
                        (e) => CardGridItem(
                          card: e.value,
                          onTap: () {
                            _showCard(context, e.key);
                          },
                        ),
                      )
                      .toList(),
                );
              }),
            )
        ],
      ),
    );
  }

  void _showCard(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CardPage(
          index: index,
          cards: _cards,
        ),
      ),
    );
  }
}
