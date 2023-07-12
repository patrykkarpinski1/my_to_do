import 'package:flutter/material.dart';

class AddNotesWidget extends StatelessWidget {
  const AddNotesWidget({
    required this.onTitleChanged,
    required this.onTextChanged,
    Key? key,
  }) : super(key: key);
  final Function(String) onTitleChanged;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(children: [
        TextField(
          onChanged: onTitleChanged,
          maxLength: 75,
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Title',
            border: InputBorder.none,
          ),
        ),
        TextField(
          onChanged: onTextChanged,
          maxLines: 30,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Text',
          ),
        ),
      ]),
    );
  }
}
