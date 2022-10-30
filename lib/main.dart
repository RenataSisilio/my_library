import 'package:flutter/material.dart';

import 'features/home.dart';
import 'features/list.dart';
import 'features/new_book.dart';
import 'src/library.dart';

void main() {
  initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leitura Espiritual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => const HomePage(),
        'addBook': (context) => NewBookPage(),
        'list': (context) => ListPage(),
      },
      home: const HomePage(),
    );
  }
}
