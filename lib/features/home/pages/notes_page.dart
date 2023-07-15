import 'package:flutter/material.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:my_to_do/features/home/pages/add_notes_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:my_to_do/widgets/note_widget.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    Key? key,
    required this.noteModels,
  }) : super(key: key);

  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: NewGradientAppBar(
        gradient:
            const LinearGradient(colors: [Colors.indigo, Colors.blueGrey]),
        title: const Center(child: Text('My To Do')),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(209, 255, 255, 255),
              Color.fromARGB(116, 255, 255, 255),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              if (noteModels.isEmpty) ...[
                const Center(
                  child: Text('Your list is empty, add a task.'),
                ),
              ] else
                for (final noteModel in noteModels) ...[
                  Dismissible(
                    key: ValueKey(noteModel.id),
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 32.0),
                            child: Icon(
                              Icons.delete,
                            ),
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      // only from right to left
                      return direction == DismissDirection.endToStart;
                    },
                    onDismissed: (direction) {
                      context
                          .read<HomeCubit>()
                          .remove(documentID: noteModel.id);
                    },
                    child: NoteWidget(noteModel: noteModel),
                  ),
                ]
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.indigo, Colors.blueGrey],
          ),
          borderRadius: BorderRadius.circular(55),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: context.read<HomeCubit>(),
                      child: const AddNotesPage(),
                    )));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
