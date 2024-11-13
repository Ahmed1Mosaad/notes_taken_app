
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_color_show_model_bottom_sheet.dart';


class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom ),
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: black,
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
                padding:const EdgeInsets.only(left: 8,right: 8,top: 8,),
                child: Column(
                  children: [
                    const CustomTextField(
                      hintText: 'title',
                    ),
                    const SizedBox(height: 30),
                    const CustomTextField(hintText: 'Content'),
                    const SizedBox(height: 20),
                    const SizedBox(
                        height: 80, child: ListViewColorsBottomSheet()),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(400, 40),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Add Note',
                            style: TextStyle(color: Colors.amber)))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
