import 'package:flutter/material.dart';
import 'package:my_to_do/app/core/enums.dart';
import 'package:my_to_do/app/injection_container.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/features/home/pages/notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt()..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
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
          final noteModels = state.notes;
          if (state.status == Status.success) {
            if (state.notes.isEmpty) {
              return NotesPage(noteModels: noteModels);
            }
          }

          return NotesPage(noteModels: noteModels);
        },
      ),
    );
  }
}
