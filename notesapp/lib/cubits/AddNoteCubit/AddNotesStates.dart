abstract class AddNotesStates {}

class AddNotesInitial extends AddNotesStates {}

class AddNotesLoading extends AddNotesStates {}

class AddNotesSuccsses extends AddNotesStates {}

class AddNotesFail extends AddNotesStates {
  final String errMessage;
  AddNotesFail(this.errMessage);
}
