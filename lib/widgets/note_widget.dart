import 'package:flutter/material.dart';
import 'package:my_to_do/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        noteModel.title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
