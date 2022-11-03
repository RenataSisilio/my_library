import 'package:flutter/material.dart';

class BookForm extends StatelessWidget {
  const BookForm({
    Key? key,
    required this.titleController,
    required this.authorController,
    required this.catController,
    required this.phasesController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController authorController;
  final TextEditingController catController;
  final TextEditingController phasesController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Título'),
            ),
            validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
          ),
          TextFormField(
            controller: authorController,
            decoration: const InputDecoration(
              label: Text('Autor'),
            ),
          ),
          TextFormField(
            controller: catController,
            decoration: const InputDecoration(
              label: Text('Categorias'),
            ),
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              label: Text('Fase(s) Formativa(s)'),
            ),
            items: [
              '',
              'Postulantado I',
              'Postulantado II',
              'Discipulado I',
              'Discipulado II',
              'Consagrados'
            ]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) => phasesController.text = value ?? '',
          ),
        ],
      ),
    );
  }
}
