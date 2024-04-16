import 'package:flutter/material.dart';
import 'package:notesapp/widgets/TextField.dart';
import 'package:notesapp/widgets/button.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: 'Title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                maxLines: 5,
                hint: 'Content',
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
