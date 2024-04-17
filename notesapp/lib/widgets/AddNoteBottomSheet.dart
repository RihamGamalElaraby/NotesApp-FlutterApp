import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesStates.dart';
import 'package:notesapp/widgets/bottomSheetForm.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
//  bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNotesCubit, AddNotesStates>(
            listener: (context, state) {
              if (state is AddNotesFail) {
                print('failed');

                // isLoading =true ;
              }
              if (state is AddNotesSuccsses) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddNotesLoading ? true : false,
                  child: AddNoteForm());
            },
          ),
        ),
      ),
    );
  }
}
