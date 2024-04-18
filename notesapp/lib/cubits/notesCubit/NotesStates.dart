import 'package:notesapp/models/NoteModel.dart';

abstract class NotesStates {}

class NotesInitial extends NotesStates {}

class NotesLoading extends NotesStates {}

class NotesSuccsses extends NotesStates {
  final List<NoteModel> notes;
  NotesSuccsses(this.notes);
}

class NotesFail extends NotesStates {
  final String errMessage;
  NotesFail(this.errMessage);
}
