import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class TapItem extends StatefulWidget {
  TapItem({
    super.key,
    required this.text,
    required this.isSelected,
    this.count,
    required this.onTap,
  });

  String text;
  bool isSelected;
  int? count;
  VoidCallback? onTap;

  @override
  State<TapItem> createState() => _TapItemState();
}

class _TapItemState extends State<TapItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: widget.isSelected ? white : Colors.grey, width: 2)),
          child: Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 30,
                  color: widget.isSelected ? white : Colors.grey,
                ),
              ),
              if (widget.count != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.withOpacity(.5),
                    child: Center(
                      child: Text(
                        widget.count.toString(),
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(.4)),
                      ),
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
