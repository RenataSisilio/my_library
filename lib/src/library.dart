import 'dart:convert';

import 'package:leitura_espiritual/src/file_storage.dart';

import '../models/book.dart';

final books = <Book>[];

final categories = <String>[];

Future<void> initData() async {
  books.clear();
  categories.clear();
  final json = jsonDecode(await FileStorage().readLibrary());
  for (var e in json) {
    books.add(Book.fromJson(e));
  }
  for (var book in books) {
    for (var cat in book.categories) {
      if (!categories.contains(cat)) {
        categories.add(cat);
      }
    }
  }
  categories.sort((a, b) => a.compareTo(b));
}

Future<void> saveData() async {
  final booksToSave = <String>[];
  for (var book in books) {
    booksToSave.add(book.toJson());
  }
  var encoded = jsonEncode(booksToSave);
  await FileStorage().writeLibrary(encoded);
}
