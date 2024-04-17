import 'package:bloc/bloc.dart';
import 'package:notesapp/cubits/cubit/notesStates.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());
}
