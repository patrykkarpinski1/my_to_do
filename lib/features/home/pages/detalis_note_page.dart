import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/app/core/enums.dart';
import 'package:my_to_do/app/injection_container.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:my_to_do/models/note_model.dart';

class DetailsNotePage extends StatelessWidget {
  const DetailsNotePage({super.key, required this.id, this.noteModel});
  final String id;
  final NoteModel? noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt()..getNoteWithID(id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == Status.initial) {
            return const Center(
              child: Text('Initial state'),
            );
          }
          if (state.status == Status.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == Status.success) {
            if (state.noteModel == null) {
              return const SizedBox.shrink();
            }
          }
          final noteModel = state.noteModel;

          return Scaffold(
            backgroundColor: Colors.transparent,
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
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        noteModel?.title ?? 'Unkown',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(noteModel?.text ?? 'Unkown')
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
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
