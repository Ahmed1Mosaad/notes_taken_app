import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: hintText == 'Content'?5:1,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(.2))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(.9))),
          hintText: hintText,
          hintStyle: TextStyle(color: lightYellow)),
    );
  }
}
