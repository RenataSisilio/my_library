import 'dart:convert';
import 'dart:io';

import '../models/book.dart';

final books = <Book>[];

final categories = <String>[];

void initData() {
  books.clear();
  categories.clear();
  final json = jsonDecode(File('lib/src/library.json').readAsStringSync());
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

void saveData() {
  final booksToSave = <String>[];
  for (var book in books) {
    booksToSave.add(book.toJson());
  }
  var encoded = jsonEncode(booksToSave);
  File('lib/src/library.json').writeAsString(encoded);
}
