import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/book.dart';
import '../src/library.dart';
import '../widgets/book_form.dart';

class NewBookPage extends StatefulWidget {
  NewBookPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  State<NewBookPage> createState() => _NewBookPageState();
}

class _NewBookPageState extends State<NewBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final catController = TextEditingController();
  final phasesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Form(
              key: widget.formKey,
              child: BookForm(
                  titleController: titleController,
                  authorController: authorController,
                  catController: catController,
                  phasesController: phasesController),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.formKey.currentState!.validate()) {
                    final book = Book(
                      title: titleController.text,
                      author: authorController.text,
                      categories: catController.text.split(','),
                      phase: phasesController.text.split(','),
                    );
                    books.add(book);
                    final booksToSave = <String>[];
                    for (var book in books) {
                      booksToSave.add(book.toJson());
                    }
                    var encoded = jsonEncode(booksToSave);
                    File('lib/src/library.json').writeAsString(encoded);
                    Navigator.of(context).pushReplacementNamed('home');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ADICIONAR'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
