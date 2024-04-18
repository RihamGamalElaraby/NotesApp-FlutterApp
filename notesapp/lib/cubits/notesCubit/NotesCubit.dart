import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/models/NoteModel.dart';

import 'NotesStates.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(KNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccsses(notes));
    } on Exception catch (e) {
      emit(NotesFail(e.toString()));
    }
  }
}
