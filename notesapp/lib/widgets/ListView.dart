import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notesCubit/NotesCubit.dart';
import 'package:notesapp/cubits/notesCubit/NotesStates.dart';
import 'package:notesapp/models/NoteModel.dart';
import 'package:notesapp/widgets/CustomNoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              },
              itemCount: notes.length,
            ),
          ),
        );
      },
    );
  }
}
