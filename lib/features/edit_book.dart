import 'package:flutter/material.dart';

import '../models/book.dart';
import '../src/library.dart';
import '../widgets/book_form.dart';

class EditBookPage extends StatefulWidget {
  EditBookPage(int index, {super.key}) : book = books[index];

  final formKey = GlobalKey<FormState>();
  final Book book;

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final catController = TextEditingController();
  final phasesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.book.title;
    authorController.text = widget.book.author;
    catController.text = widget.book.catString.replaceAll(', ', ',');
    phasesController.text = widget.book.phases
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(', ', ',');
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
                      id: widget.book.id,
                      title: titleController.text,
                      author: authorController.text,
                      categories: catController.text.split(','),
                      phase: phasesController.text.split(','),
                    );
                    books[book.id] = book;
                    saveData();
                    Navigator.of(context).pushReplacementNamed('home');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('SALVAR'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
