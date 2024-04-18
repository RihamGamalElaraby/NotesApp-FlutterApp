import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontap, this.isLoading = false});
  final void Function()? ontap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.black,
                  )
                : Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
