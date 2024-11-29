import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomeTextFormField extends StatefulWidget {
  final String hintText;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  bool obscureText;
  bool showenSuffixIcon;
  CustomeTextFormField({
    this.obscureText = false,
    super.key,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.showenSuffixIcon = false,
  });

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.showenSuffixIcon) {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              }
            },
            icon: Icon(
              widget.showenSuffixIcon
                  ? widget.obscureText == false
                      ? Icons.visibility
                      : Icons.visibility_off
                  : null,
              size: 20,
              color: const Color.fromARGB(255, 238, 161, 135),
            ),
          ),
          border: const OutlineInputBorder(),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: white)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 244, 138, 106)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          errorStyle:
              const TextStyle(color: Color.fromARGB(255, 252, 143, 110)),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15)),
    );
  }
}
