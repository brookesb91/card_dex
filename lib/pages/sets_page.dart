import 'dart:async';

import 'package:card_dex/models/pokemon_card_set.dart';
import 'package:card_dex/pages/set_page.dart';
import 'package:card_dex/repositories/set_repository.dart';
import 'package:card_dex/widgets/set_list_item.dart';
import 'package:flutter/material.dart';

class SetsPage extends StatefulWidget {
  const SetsPage({super.key});

  @override
  State<SetsPage> createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  final SetRepository _repository = SetRepository();
  List<PokemonCardSet> _sets = [];
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

    _subscription = _repository.list().asStream().listen((sets) {
      setState(() {
        _sets = sets;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Image.asset(
                'images/logo.png',
                height: 32,
              ),
            ),
          ),
          if (_isLoading)
            const SliverFillRemaining(
                child: Center(
              child: CircularProgressIndicator(),
            )),
          if (!_isLoading)
            SliverList.list(
              children: _sets
                  .map(
                    (set) => SetListItem(
                      trailing: const Icon(Icons.chevron_right),
                      set: set,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SetPage(set: set),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            )
        ],
      ),
    );
  }
}
