import 'dart:convert';
import 'dart:io';

import '../models/book.dart';

final books = <Book>[];

final categories = <String>[];

void initData() {
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
}
