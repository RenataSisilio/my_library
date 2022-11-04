import 'package:flutter/material.dart';

import '../features/list.dart';
import '../src/local.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    this.pop = false,
  }) : super(key: key);

  final bool pop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: const Text('POR FASE'),
            children: [
              'Postulantado I',
              'Postulantado II',
              'Discipulado I',
              'Discipulado II',
              'Consagrados'
            ]
                .map(
                  (phase) => ListTile(
                    title: Text(phase),
                    onTap: () {
                      if (pop) {
                        Navigator.pop(context);
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ListPage(phase: phase),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            title: const Text('POR TEMA'),
            children: categories
                .where((cat) => cat != '')
                .map(
                  (cat) => ListTile(
                    title: Text(cat),
                    onTap: () {
                      if (pop) {
                        Navigator.pop(context);
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ListPage(category: cat),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
          pop
              ? ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('INÍCIO'),
                  onTap: () {
                    if (pop) {
                      Navigator.pop(context);
                    }
                    Navigator.of(context).pushReplacementNamed('home');
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
