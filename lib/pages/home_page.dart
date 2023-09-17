import 'package:card_dex/pages/sets_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: const [
        SetsPage(),
        Scaffold(
          body: Text('Other Page'),
        )
      ]),
    );
  }
}
