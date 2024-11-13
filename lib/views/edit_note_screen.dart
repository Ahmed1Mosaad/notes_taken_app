import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_color_show_model_bottom_sheet.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Edit Note',
                    style: TextStyle(
                      color: gold,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.check),
                  iconSize: 33,
                  color: gold,
                  highlightColor: lightYellow,
                  style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                    color: Colors.white.withOpacity(.2),
                    width: 2,
                  ))),
                ),
              ],
            ),
    
            Column(
              children: [
                const SizedBox(height: 50,),
                const CustomTextField(
                  hintText: 'title',
                ),
                const SizedBox(height: 30),
                const CustomTextField(hintText: 'Content'),
                const SizedBox(height: 20),
                const SizedBox(height: 80, child: ListViewColorsBottomSheet()),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 40),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Add Note',
                        style: TextStyle(color: Colors.amber)))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
