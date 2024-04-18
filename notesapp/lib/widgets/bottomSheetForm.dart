import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesStates.dart';
import 'package:notesapp/models/NoteModel.dart';
import 'package:notesapp/widgets/TextField.dart';
import 'package:notesapp/widgets/button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            onsaved: (val) {
              title = val;
            },
            hint: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (val) {
              subtitle = val;
            },
            maxLines: 5,
            hint: 'Content',
          ),
          SizedBox(
            height: 50,
          ),
          BlocBuilder<AddNotesCubit, AddNotesStates>(builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNotesLoading ? true : false,
              ontap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentTime = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat.yMd().format(currentTime);

                  var noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
                ;
              },
            );
          }),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
