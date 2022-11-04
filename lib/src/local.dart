import 'package:shared_preferences/shared_preferences.dart';

import '../models/book.dart';
import 'initial_library.dart';

final books = <Book>[];

final categories = <String>[];

Future<void> initData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!(prefs.getBool('hasData') ?? false)) {
    books.addAll(initialLibrary.map((e) => Book.fromJson(e)));
    prefs.setBool('hasData', true);
  } else {
    books.clear();
    categories.clear();
    final List<String> list = prefs.getStringList('books') ?? [];
    for (var e in list) {
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
  categories.sort((a, b) => a.compareTo(b));
}

Future<void> saveData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final booksToSave = <String>[];
  for (var book in books) {
    booksToSave.add(book.toJson());
  }
  prefs.setStringList('books', booksToSave);
}
