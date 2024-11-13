import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_colors_of_show_general_daolog.dart';

class ShowGeneralDialogPage extends StatelessWidget {
  ShowGeneralDialogPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: Stack(
        children: [
          Positioned(
            top: 378,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 3, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                  )),
              width: 188,
              height: 316,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Material(
                          color: black,
                          child: Column(
                            children: [
                              const CustomTextField(
                                hintText: 'title',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const CustomTextField(
                                hintText: 'content',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: ListViewColors(colorsList: colorsList),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Add Note',
                                    style: TextStyle(color: Colors.amber),
                                  ))
                            ],
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
