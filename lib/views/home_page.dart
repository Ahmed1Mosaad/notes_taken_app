import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/card_item.dart';
import 'package:notes_application/widgets/container_card.dart';
import 'package:notes_application/widgets/icon_search.dart';
import 'package:notes_application/widgets/show_modal_bottom_sheet.dart';
import 'package:notes_application/widgets/tap_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelectedIndex = 0;

  void onTap(int index) {
    setState(() {
      isSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          showModalBottomSheet(
            context:context,
            isScrollControlled: true,
            builder: (context){
              return ShowModalBottomSheet();
            }
          );
        },
        shape: const CircleBorder(side: BorderSide(color: Colors.tealAccent)),
        backgroundColor: Colors.tealAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: const SizedBox(height: 30)),
                  // !       icon search
                  SliverToBoxAdapter(child: IconSearch()),

                  // !       My Notes
                  const SliverToBoxAdapter(
                    child: const Text('My',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w400,
                            color: white)),
                  ),
                  const SliverToBoxAdapter(
                    child: const Text('Notes',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w400,
                            color: white)),
                  ),
                  const SliverToBoxAdapter(child:  SizedBox(height: 5)),

                  // ! Categories
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TapItem(
                            onTap: () {
                              return onTap(0);
                            },
                            isSelected: isSelectedIndex == 0,
                            text: 'All',
                            count: 20,
                          ),
                          const SizedBox(width: 10),
                          TapItem(
                            onTap: () {
                              return onTap(1);
                            },
                            isSelected: isSelectedIndex == 1,
                            text: 'Primary',
                          ),
                          const SizedBox(width: 10),
                          TapItem(
                            onTap: () {
                              return onTap(2);
                            },
                            isSelected: isSelectedIndex == 2,
                            text: 'Secondary',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25,
                    ),
                  ),
                  // ! Two Cards
                  const SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: CardItem(
                              textTitle: 'Plan For The Day',
                              coloredItem: orange,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: CardItem(
                                  textTitle: 'Image Notes',
                                  coloredItem: yellow)),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(childCount:1,
                          (context, index) {
                    return const ContainerCard();
                  })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
