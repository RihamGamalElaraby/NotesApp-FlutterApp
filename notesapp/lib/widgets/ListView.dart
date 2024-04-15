import 'package:flutter/material.dart';
import 'package:notesapp/widgets/CustomNoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: const NoteItem(),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
