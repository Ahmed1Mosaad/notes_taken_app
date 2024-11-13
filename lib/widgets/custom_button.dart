import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  String? image;
  final void Function()? onPressed;
  CustomButton({
    this.image,
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(500, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          side: BorderSide(
            color: image == null ? orange : white,
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image == null
              ? Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
              : Row(
                  children: [
                    Image(
                      image: AssetImage(image!),
                      width: 24,
                      height: 24,
                    ),
                    Text(
                      '   $text',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
