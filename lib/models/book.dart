import 'dart:convert';

import '../src/local.dart';

class Book {
  Book({
    int? id,
    required this.title,
    this.author = '',
    required List<String> categories,
    phase = const <String>[],
  }) {
    this.id = id ?? books[books.length - 1].id + 1;
    _categories.addAll(categories);
    _phases.addAll(phase);
  }

  late final int id;
  String title;
  String author;
  final _categories = <String>[];
  final _phases = <String>[];

  List<String> get categories => _categories;
  List<String> get phases => _phases;

  String get catString {
    String string = '';
    for (var element in _categories) {
      string += '$element, ';
    }
    string = string.substring(0, string.length - 2);
    return string;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'categories': _categories,
      'phase': _phases,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'] as String,
      author: map['author'] as String,
      categories: List<String>.from(map['categories']),
      phase: List<String>.from(map['phase']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
