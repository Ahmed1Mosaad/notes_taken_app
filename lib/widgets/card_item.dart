import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForCard/NotesCardCubit/notes_card_cubit.dart';
import 'package:notes_application/cubits/NoteForCard/NotesCardCubit/notes_card_states.dart';
import 'package:notes_application/widgets/custom_text_card.dart';
import 'package:notes_application/widgets/icon_heart_add.dart';
import 'package:notes_application/widgets/two_lines.dart';

class CardItem extends StatefulWidget {
  final String textTitle;
  final Color coloredItem;

  const CardItem({
    super.key,
    required this.textTitle,
    required this.coloredItem,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isSelectedIconHeart = false;
  bool isSelectedTextNote = false;
  @override
  void initState() {
    BlocProvider.of<NotesCardCubit>(context).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCardCubit, NotesCardStates>(
      builder: (context, state) {
        return Container(
          height: 320,
          decoration: BoxDecoration(
            color: widget.coloredItem,
            borderRadius: widget.coloredItem == orange
                ? const BorderRadius.only(
                    topRight: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(55),
                    topLeft: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                  ),
          ),
          child: Column(
            children: [
              // -_
              TwoLines(
                color: black.withOpacity(.8),
              ),
              const SizedBox(
                height: 15,
              ),
              // text
              ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  title: Text(
                    widget.textTitle,
                    style: const TextStyle(
                        fontSize: 20,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                  //!      icon heart and add
                  trailing: IconHeartAdd(coloredItem: widget.coloredItem)),
              // ! custom_text_container  and  image
              widget.coloredItem == orange
                  ? Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: BlocProvider.of<NotesCardCubit>(context)
                              .modelList!
                              .length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                                            key: Key(BlocProvider.of<NotesCardCubit>(context)
                                  .modelList![index]
                                  .title), // A unique key for each item
                              onDismissed: (direction) {
                                // Remove the item from the model list on dismissal
                                        setState(() {
                                BlocProvider.of<NotesCardCubit>(context)
                                    .modelList![index].delete();
                                        BlocProvider.of<NotesCardCubit>(context).fetchNotes();
                                        });
                                        },
                              child: CustomTextContainer(
                                  model:
                                      BlocProvider.of<NotesCardCubit>(context)
                                          .modelList![index]),
                            );
                          }))
                  : Container(
                      child: const Expanded(
                          child: Image(
                        image: AssetImage('assets/images/marmoush.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                    ),
            ],
          ),
        );
      },
    );
  }
}
