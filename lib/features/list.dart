import 'package:flutter/material.dart';

import '../models/book.dart';
import '../src/library.dart';
import '../widgets/drawer.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._category!=''?widget._category:widget._phase),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: display.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(display[index].title),
            subtitle: Text(display[index].author),
          ),
        ),
        drawer: const MyDrawer());
  }
}
