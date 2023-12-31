import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/app/core/enums.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:my_to_do/widgets/add_notes_widget.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  String? text;
  String? title;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.saved) {
          context.read<HomeCubit>().start();
          Navigator.of(context).pop();
        }
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
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: NewGradientAppBar(
            gradient:
                const LinearGradient(colors: [Colors.indigo, Colors.blueGrey]),
            actions: [
              IconButton(
                  onPressed: text == null || title == null
                      ? null
                      : () {
                          context.read<HomeCubit>().add(
                                text!,
                                title!,
                              );
                        },
                  icon: const Icon(Icons.check))
            ],
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
            child: AddNotesWidget(
              onTitleChanged: (newValue) {
                setState(() {
                  title = newValue;
                });
              },
              onTextChanged: (newValue) {
                setState(() {
                  text = newValue;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
