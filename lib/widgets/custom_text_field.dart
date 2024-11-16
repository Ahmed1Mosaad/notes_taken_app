import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  final String hintText;
  void Function(String value)? onChanged;
  CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      maxLines: widget.hintText == 'Content' ? 5 : 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(.2))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(.9))),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: lightYellow)),
    );
  }
}
