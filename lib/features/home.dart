import 'package:flutter/material.dart';

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
          children: [
            const Text(
              'Bem-vindo(a)!\n\nBusque seu livro:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  final children = <ListTile>[];
                  if (index == 0) {
                    for (var phase in [
                      'Postulantado I',
                      'Postulantado II',
                      'Discipulado',
                      'Consagrados'
                    ]) {
                      children.add(
                        ListTile(
                          title: Text(phase),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ListPage(phase: phase),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return ExpansionTile(
                        title: const Text('POR FASE'), children: children);
                  }
                  for (var cat in categories) {
                    children.add(
                      ListTile(
                        title: Text(cat),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ListPage(category: cat),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return ExpansionTile(
                      title: const Text('POR TEMA'), children: children);
                },
              ),
            )
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
