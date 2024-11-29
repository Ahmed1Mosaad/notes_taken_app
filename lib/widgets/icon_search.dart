import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:notes_application/views/login_page.dart';
import 'package:notes_application/widgets/custom_search_delegate.dart';

class IconSearch extends StatelessWidget {
  final IconData icon;
  const IconSearch({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          AudioPlayer().play(
            AssetSource('sounds/button.mp3'),
          );
          if (icon == const Icon(Icons.search)) {
            showSearch(context: context, delegate: CustomSearchDelegate());
          } else {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }));
          }
        },
        child: CircleAvatar(
          radius: 39,
          backgroundColor: Colors.grey.withOpacity(.2),
          child: Icon(
            icon,
            size: 33,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
