import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/show_general_dialog_page.dart';

class IconHeartAdd extends StatefulWidget {
  final Color coloredItem;

  const IconHeartAdd({super.key, required this.coloredItem});

  @override
  State<IconHeartAdd> createState() => _IconHeartAddState();
}

class _IconHeartAddState extends State<IconHeartAdd> {
  bool isSelectedIconHeart = false;

  @override
  Widget build(BuildContext conetxt) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.black.withOpacity(.06),
      child: widget.coloredItem == orange
          ? IconButton(
              onPressed: () {},
              icon: IconButton(
                  onPressed: () {
                    showGeneralDialog(
                       transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Slide in from the left
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1,0), // Start from the left
            end: Offset.zero,           // End at the center
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );},
                      transitionDuration: Duration(microseconds:500),
                      barrierColor: Colors.black.withOpacity(.2),
                        barrierLabel: '',
                        barrierDismissible: true,
                        context: context,
                        pageBuilder: (conetxt, animation, secondaryAnimation) {
                          return Container(
                            child: ShowGeneralDialogPage(),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 27,
                    color: Color.fromARGB(255, 210, 66, 50),
                    grade: 2,
                  )))
          : isSelectedIconHeart == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.coloredItem == yellow) {
                        isSelectedIconHeart = !isSelectedIconHeart;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 210, 85, 72),
                    grade: 2,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.coloredItem == yellow) {
                        isSelectedIconHeart = !isSelectedIconHeart;
                      }
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.heart,
                    color: Color.fromARGB(255, 210, 85, 72),
                    grade: 2,
                  ),
                ),
    );
  }
}
