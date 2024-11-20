import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_cubit.dart';

class ListViewColorsBottomSheet extends StatefulWidget {
const  ListViewColorsBottomSheet({
    super.key,
  });

  @override
  State<ListViewColorsBottomSheet> createState() =>
      _ListViewColorsBottomSheetState();
}

class _ListViewColorsBottomSheetState extends State<ListViewColorsBottomSheet> {
  int isSelectedIndex = 100;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 4,
        );
      },
      itemCount: colorsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelectedIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = colorsList[index];
            });
          },
          child: isSelectedIndex == index
              ? CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: colorsList[index],
                  ),
                )
              : CircleAvatar(
                  radius: 36,
                  backgroundColor: colorsList[index],
                ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}























                  // ! FloatingActionButton
                  //     children: [
                  //       Container(
                  //         height: 1,
                  //         color: Colors.transparent,
                  //       ),
                  //       Positioned(
                  //         top: 90,
                  //         left: 120,
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(50),
                  //               color: white.withOpacity(.08),
                  //               border: Border.all(
                  //                   color: white.withOpacity(.2), width: 3)),
                  //           width: 175,
                  //           height: 83,
                  //           child: ClipRRect(
                  //             borderRadius: BorderRadius.circular(50),
                  //             child: BackdropFilter(
                  //               filter: ImageFilter.blur(
                  //                 sigmaX: 5,
                  //                 sigmaY: 5,
                  //               ),
                  //               child: Row(
                  //                 children: [
                  //                   // ! add button
                  //                   Expanded(
                  //                     child: GestureDetector(
                  //                       onTap: () {},
                  //                       child: Container(
                  //                         width: 80,
                  //                         height: 80,
                  //                         decoration: BoxDecoration(
                  //                           borderRadius:
                  //                               BorderRadius.circular(50),
                  //                           color: black,
                  //                         ),
                  //                         child: Icon(
                  //                           Icons.add,
                  //                           size: 30,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   // ! voice
                  //                   Expanded(
                  //                     child: GestureDetector(
                  //                       onTap: () {},
                  //                       child: ClipRRect(
                  //                         borderRadius:
                  //                             BorderRadius.circular(50),
                  //                         child: BackdropFilter(
                  //                           filter: ImageFilter.blur(
                  //                             sigmaX: 10,
                  //                             sigmaY: 10,
                  //                           ),
                  //                           child: Container(
                  //                             width: 80,
                  //                             height: 80,
                  //                             decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(50),
                  //                               color: white.withOpacity(.2),
                  //                             ),
                  //                             child: Icon(
                  //                               Icons.mic,
                  //                               size: 30,
                  //                               color: white,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
