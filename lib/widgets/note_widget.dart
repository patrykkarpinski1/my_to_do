import 'package:flutter/material.dart';
import 'package:my_to_do/features/home/pages/detalis_note_page.dart';
import 'package:my_to_do/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color.fromARGB(255, 226, 223, 223),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  noteModel.title,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: false).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => DetailsNotePage(
                          id: noteModel.id,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.navigate_next)),
            ],
          ),
        ),
      ),
    );
  }
}
