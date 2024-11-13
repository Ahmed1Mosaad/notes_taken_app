import 'package:flutter/material.dart';



class ListViewColors extends StatefulWidget {
  
  const ListViewColors({
    super.key,
    required this.colorsList,
  });

  final List<Color> colorsList;

  @override
  State<ListViewColors> createState() => _ListViewColorsState();
}

class _ListViewColorsState extends State<ListViewColors> {
int isSelectedIndex = 100;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(width: 4,);
      },
      itemCount: widget.colorsList.length,
      itemBuilder: (context, index) {
        return 
        GestureDetector(
          onTap: (){
            setState(() {
              isSelectedIndex = index;
            });
          },
          child: 
          isSelectedIndex == index ? CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: widget.colorsList[index],
            ),
          ):
          CircleAvatar(
            radius: 23,
            backgroundColor: widget.colorsList[index],
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
