import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/views/content_note.dart';
import 'package:notes_application/views/edit_note_screen.dart';
import 'package:notes_application/widgets/two_lines.dart';

class ContainerCard extends StatefulWidget {
  final ContainerItemModel model;
  const ContainerCard({required this.model, Key? key}) : super(key: key);

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  bool isSelectedTextNote = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AudioPlayer().play(AssetSource('sounds/button.mp3'));
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContentNote(
            model: widget.model,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          decoration: BoxDecoration(
              color: Color(widget.model.color),
              borderRadius: BorderRadius.circular(55)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TwoLines(
                color: black.withOpacity(.8),
              ),
              ListTile(
                  contentPadding: const EdgeInsets.only(
                      top: 16, left: 16, right: 0, bottom: 0),
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
                          margin: const EdgeInsets.only(left: 8),
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
                        color: isSelectedTextNote
                            ? black
                            : Colors.black.withOpacity(.4),
                        fontSize: 25,
                        decoration: isSelectedTextNote
                            ? null
                            : TextDecoration.lineThrough,
                        decorationColor: isSelectedTextNote
                            ? null
                            : Colors.black.withOpacity(.3),
                        decorationThickness: isSelectedTextNote ? null : 2,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: CircleAvatar(
                      radius: 35,
                      backgroundColor: black.withOpacity(.05),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditNoteScreen(
                              model: widget.model,
                            );
                          }));
                        },
                        icon: const Icon(Icons.edit),
                        color: black,
                      ))),
              Padding(
                padding: const EdgeInsets.only(right: 48.0, bottom: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.model.date,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
