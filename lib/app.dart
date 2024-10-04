import 'package:card_dex/pages/home_page.dart';
import 'package:card_dex/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardDex',
      theme: theme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
