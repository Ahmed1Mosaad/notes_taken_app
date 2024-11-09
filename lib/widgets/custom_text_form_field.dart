import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomeTextFormField extends StatelessWidget {
  final String hintText;
  const CustomeTextFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: white)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15)),
    );
  }
}
