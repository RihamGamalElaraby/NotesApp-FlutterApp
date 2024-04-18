import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesStates.dart';
import 'package:notesapp/widgets/bottomSheetForm.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
//  bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesStates>(
          listener: (context, state) {
        if (state is AddNotesFail) {
          print('failed');

          // isLoading =true ;
        }
        if (state is AddNotesSuccsses) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNotesLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(child: AddNoteForm()),
          ),
        );
      }),
    );
  }
}
