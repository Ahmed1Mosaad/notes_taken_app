import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class IconSearch extends StatelessWidget {
  const IconSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          
          AudioPlayer().play(AssetSource('sounds/button.mp3'),);
        },
        child: CircleAvatar(
          radius: 39,
          backgroundColor: Colors.grey.withOpacity(.2),
          child: const Icon(
            Icons.search,
            size: 33,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
