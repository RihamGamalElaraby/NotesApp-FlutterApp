import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/models/NoteModel.dart';
import 'package:notesapp/widgets/ColorsItem.dart';

class EditNotesColorsList extends StatefulWidget {
  EditNotesColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int currenIndex;

  @override
  void initState() {
    currenIndex = kcolors.indexOf(Color(widget.note.color));
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.note.color = kcolors[index].value;
                  currenIndex = index;
                  print(currenIndex);
                });
              },
              child: ColorItem(
                color: kcolors[index],
                isActive: currenIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
