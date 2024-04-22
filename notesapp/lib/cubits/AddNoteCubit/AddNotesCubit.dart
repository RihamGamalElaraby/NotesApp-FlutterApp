import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesStates.dart';
import 'package:notesapp/models/NoteModel.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitial());
  // bool isLoading = false;
  Color color = Color(0xff595758);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    // isLoading = true;
    try {
      var notesBox = Hive.box<NoteModel>(KNotesBox);
      // isLoading = false;
      await notesBox.add(note);
      emit(AddNotesSuccsses());
    } on Exception catch (e) {
      // isLoading = false;

      emit(AddNotesFail(e.toString()));
    }
  }
}
