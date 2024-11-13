import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/views/content_note.dart';
import 'package:notes_application/widgets/two_lines.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AudioPlayer().play(AssetSource('sounds/button.mp3'));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContentNote(),));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          decoration: BoxDecoration(
              color: lightYellow, borderRadius: BorderRadius.circular(55)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               TwoLines(color:black.withOpacity(.8),),
              ListTile(
                  contentPadding: const EdgeInsets.only(
                      top: 16, left: 16, right: 0, bottom: 0),
                  leading: const CircleAvatar(
                    radius: 35,
                    backgroundColor: white,
                    child: Text(
                      '😄',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  title: Text(
                    'My Lectures',
                    style: const TextStyle(
                        color: black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: CircleAvatar(
                      radius: 35,
                      backgroundColor: black.withOpacity(.05),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('EditNoteScreen');
                          
                        },
                        icon: Icon(Icons.edit),
                        color: black,
                      ))),
         
              Padding(
                padding: const EdgeInsets.only(right: 48.0,bottom: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '30/03/2024',
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
