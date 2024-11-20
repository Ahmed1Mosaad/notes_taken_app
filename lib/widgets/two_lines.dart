import 'package:flutter/material.dart';

class TwoLines extends StatelessWidget {
  final Color color;
  const TwoLines({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:const EdgeInsets.only(top: 7),
          child: Container(
            width: 32,
            height: 2,
            color: color,
            // color: black.withOpacity(.8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Container(
            width: 16,
            height: 2,
            color:color,
            // color: black.withOpacity(.8),
          ),
        ),
      ],
    );
  }
}
