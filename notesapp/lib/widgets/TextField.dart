import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onsaved,
      this.onchanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onsaved;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      onChanged: onchanged,
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return 'field is empty';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: KprimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: KprimaryColor),
        border: buildBoarder(),
        enabledBorder: buildBoarder(),
        focusedBorder: buildBoarder(KprimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBoarder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color ?? Colors.white),
    );
  }
}
