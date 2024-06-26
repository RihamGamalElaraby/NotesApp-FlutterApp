import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubits/AddNoteCubit/AddNotesCubit.dart';
import 'package:notesapp/widgets/ColorsItem.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currenIndex = 0;

  @override
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
                BlocProvider.of<AddNotesCubit>(context).color = kcolors[index];
                setState(() {
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
