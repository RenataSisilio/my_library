import 'package:flutter/material.dart';
import 'package:leitura_espiritual/widgets/drawer.dart';

import '../src/library.dart';
import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leitura Espiritual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            Text(
              'Bem-vindo(a)!\n\nBusque seu livro:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            Expanded(child: Menu())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('addBook');
          setState(() {});
        },
        tooltip: 'Novo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
