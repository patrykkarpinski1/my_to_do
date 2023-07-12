import 'package:flutter/material.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:my_to_do/features/home/pages/add_notes_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:my_to_do/widgets/note_widget.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    Key? key,
    required this.noteModels,
  }) : super(key: key);

  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My To Do')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (noteModels.isEmpty) ...[
              const Center(
                child: Text('Your list is empty, add a task.'),
              ),
            ],
            for (final noteModel in noteModels) ...[
              NoteWidget(noteModel: noteModel),
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: const AddNotesPage(),
                  )));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
