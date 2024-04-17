import 'package:flutter/material.dart';
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
          CustomButton(
            ontap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
              ;
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
