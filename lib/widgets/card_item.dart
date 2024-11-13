import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/custom_text_container.dart';
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
  Widget build(BuildContext context) {
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
           TwoLines(color:black.withOpacity(.8),),
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
                    fontSize: 20, color: black, fontWeight: FontWeight.bold),
              ),
              //!      icon heart and add
              trailing: IconHeartAdd(coloredItem: widget.coloredItem)),
          // ! custom_text_container  and  image
          widget.coloredItem == orange
              ? Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CustomTextContainer(text: 'text');
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
  }
}
