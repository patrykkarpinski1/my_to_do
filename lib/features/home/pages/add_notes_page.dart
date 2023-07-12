import 'package:flutter/material.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: const [
          TextField(
            maxLength: 75,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
          ),
          TextField(
            maxLines: 30,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Text',
            ),
          ),
        ]),
      ),
    );
  }
}
