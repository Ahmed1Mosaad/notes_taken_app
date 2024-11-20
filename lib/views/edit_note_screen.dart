import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForHomePage/NotesCubit/notes_cubit.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_cubit.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_state.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_color_show_model_bottom_sheet.dart';

class EditNoteScreen extends StatelessWidget {
  final ContainerItemModel model;
  String? title;
  String? subTitle;
  EditNoteScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          BlocBuilder<AddNoteCubit, AddNoteStates>(builder: (context, state) {
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
                        model.title = title ?? model.title;
                        model.subTitle = subTitle ?? model.subTitle;
                        model.color =
                            BlocProvider.of<AddNoteCubit>(context).color.value;
                        model.save();
                        BlocProvider.of<NotesCubit>(context).getNotes();

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
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      controller: TextEditingController(text: model.title),
                      hintText: 'title',
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: TextEditingController(text: model.subTitle),
                      hintText: 'Content',
                      onChanged: (String value) {
                        subTitle = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                        height: 80, child: ListViewColorsBottomSheet()),
                    const SizedBox(height: 20),
                  ],
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
