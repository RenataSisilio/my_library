import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leitura_espiritual/features/edit_book.dart';

import '../models/book.dart';
import '../src/library.dart';
import '../widgets/menu.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    super.key,
    String? category,
    String? phase,
  })  : _category = category ?? '',
        _phase = phase ?? '',
        assert((category ?? phase) != null);

  final String _category;
  final String _phase;

  @override
  State<ListPage> createState() => _HomePageState();
}

class _HomePageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final List<Book> display;
    if (widget._category.isNotEmpty) {
      display = books
          .where((book) => book.categories.contains(widget._category))
          .toList();
    } else {
      display =
          books.where((book) => book.phases.contains(widget._phase)).toList();
    }
    display.sort(((a, b) => a.title.compareTo(b.title)));
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget._category != '' ? widget._category : widget._phase),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: display.length,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Tem certeza que deseja excluir o livro "${display[index].title}"?'),
                    actions: [
                      TextButton(
                        onPressed: () => setState(() {
                          Navigator.of(context).pop();
                        }),
                        child: const Text('CANCELAR'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            books.removeWhere(
                                (book) => book.id == display[index].id);
                            final booksToSave = <String>[];
                            for (var book in books) {
                              booksToSave.add(book.toJson());
                            }
                            var encoded = jsonEncode(booksToSave);
                            File('lib/src/library.json').writeAsString(encoded);
                            Navigator.of(context).pop();
                            display.removeAt(index);
                          });
                        },
                        child: const Text('EXCLUIR'),
                      ),
                    ],
                  ),
                );
              });
            },
            child: ListTile(
              title: Text(display[index].title),
              subtitle: Text(display[index].author),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return EditBookPage(display[index].id);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        drawer: const Drawer(child: Menu(pop: true)));
  }
}
