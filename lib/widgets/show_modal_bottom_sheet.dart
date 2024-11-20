import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForHomePage/NotesCubit/notes_cubit.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_cubit.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_state.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/widgets/custom_text_field.dart';
import 'package:notes_application/widgets/list_view_color_show_model_bottom_sheet.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({
    super.key,
  });

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  String? title;

  String? subTitle;

  ContainerItemModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is LoadingAddNoteState) {}
          if (state is SuccessAddNoteState) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.of(context).pop();
          }
          if (state is FailureAddNoteState) {
            print(state.errMessage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 8,
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            onChanged: (value) {
                              title = value;
                            },
                            hintText: 'title',
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            hintText: 'Content',
                            onChanged: (String value) {
                              subTitle = value;
                            },
                          ),
                          const SizedBox(height: 20),
                        const  SizedBox(
                              height: 80, child: ListViewColorsBottomSheet()),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize:const Size(400, 40),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              onPressed: () {
                                BlocProvider.of<AddNoteCubit>(context).addNote(
                                    ContainerItemModel(
                                        title: title!,
                                        subTitle: subTitle!,
                                        color: BlocProvider.of<AddNoteCubit>(
                                                context)
                                            .color
                                            .value,
                                        date: DateFormat.yMd()
                                            .format(DateTime.now())),
                                    NoteBox1);
                                BlocProvider.of<NotesCubit>(context).getNotes();
                              },
                              child: const Text('Add Note',
                                  style: TextStyle(color: Colors.amber)))
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
