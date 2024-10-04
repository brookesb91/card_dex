import 'package:card_dex/pages/set_page.dart';
import 'package:card_dex/repositories/set_repository.dart';
import 'package:card_dex/widgets/set_list_item.dart';
import 'package:flutter/material.dart';

class SetsPage extends StatelessWidget {
  final SetRepository _repository = SetRepository();

  SetsPage({super.key});

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
          StreamBuilder(
              stream: _repository.list().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SliverList.list(
                    children: [
                      ...?snapshot.data
                          ?.map(
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
                          .toList()
                    ],
                  );
                }

                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
