import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/views/content_note.dart';

class CustomTextContainer extends StatefulWidget {
  final ContainerItemModel model;
  const CustomTextContainer({super.key, required this.model});

  @override
  State<CustomTextContainer> createState() => _CustomTextContainerState();
}

class _CustomTextContainerState extends State<CustomTextContainer> {
  bool isSelectedTextNote = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: GestureDetector(
        onTap: () {
          AudioPlayer().play(AssetSource('sounds/button.mp3'));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ContentNote(
              model: widget.model,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(widget.model.color).withOpacity(.05),
              borderRadius: BorderRadius.circular(30)),
          width: double.infinity,
          height: 60,
          child: ListTile(
            contentPadding:const EdgeInsets.all(0),
            leading: isSelectedTextNote
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSelectedTextNote = !isSelectedTextNote;
                      });
                    },
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 30,
                    color: black,
                  )
                : Container(
                    margin:const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(.3),
                    ),
                    width: 34,
                    height: 34,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelectedTextNote = !isSelectedTextNote;
                          });
                        },
                        icon: const Icon(Icons.check),
                        iconSize: 18,
                        color: white.withOpacity(.7),
                      ),
                    )),
            title: Text(
              widget.model.title,
              style: TextStyle(
                color:
                    isSelectedTextNote ? black : Colors.black.withOpacity(.4),
                fontWeight: FontWeight.bold,
                decoration:
                    isSelectedTextNote ? null : TextDecoration.lineThrough,
                decorationColor:
                    isSelectedTextNote ? null : Colors.black.withOpacity(.2),
                decorationThickness: isSelectedTextNote ? null : 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
