import 'package:flutter/material.dart';

import '../features/list.dart';
import '../src/library.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    Navigator.pop(context);
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
                  Navigator.pop(context);
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
    );
  }
}
