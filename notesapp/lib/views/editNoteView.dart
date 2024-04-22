import 'package:flutter/material.dart';
import 'package:notesapp/models/NoteModel.dart';
import 'package:notesapp/widgets/editNoreViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
