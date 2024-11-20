import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForCard/NotesCardCubit/notes_card_cubit.dart';
import 'package:notes_application/cubits/NoteForCard/addNoteCardCubit/add_note_card_cubit.dart';
import 'package:notes_application/cubits/NoteForCard/addNoteCardCubit/add_note_card_states.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_colors_of_show_general_daolog.dart';

class ShowGeneralDialogPage extends StatefulWidget {
  const ShowGeneralDialogPage({super.key});

  @override
  State<ShowGeneralDialogPage> createState() => _ShowGeneralDialogPageState();
}

class _ShowGeneralDialogPageState extends State<ShowGeneralDialogPage> {
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCardCubit(),
      child: BlocBuilder<AddNoteCardCubit, AddNoteCardStates>(
        builder: (context, state) {
          if (state is SuccessAddNoteCardStates) {
            Navigator.of(context).pop();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 12),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 8),
                            child: Material(
                                color: black,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      hintText: 'title',
                                      onChanged: (String value) {
                                        title = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField(
                                      hintText: 'content',
                                      onChanged: (String value) {
                                        subTitle = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                      child: ListViewColors(
                                          colorsList: colorsList),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<AddNoteCardCubit>(
                                                  context)
                                              .addNoteCard(ContainerItemModel(
                                                  title: title!,
                                                  subTitle: subTitle!,
                                                  color: BlocProvider.of<
                                                              AddNoteCardCubit>(
                                                          context)
                                                      .color
                                                      .value,
                                                  date: DateFormat.yMEd()
                                                      .format(DateTime.now())));
                                                      BlocProvider.of<NotesCardCubit>(context).fetchNotes();
                                        },
                                        child: const Text(
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
        },
      ),
    );
  }
}
