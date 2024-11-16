import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/widgets/two_lines.dart';

class ContentNote extends StatelessWidget {
  final ContainerItemModel model;
  const ContentNote({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(model.color),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // AudioPlayer().play(AssetSource('sounds/button.mp3'));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: black,
              size: 35,
            )),
      ),
      backgroundColor: Color(model.color),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 400,
                  height: 550,
                  color: Colors.black,
                  // .withOpacity(.062),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                            child: TwoLines(
                          color: Color(model.color),
                        )),
                        const Spacer(),
                        Center(
                          child: Text(
                            model.title,
                            style: const TextStyle(
                                color: gold,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            model.subTitle,
                            style: const TextStyle(
                                color: lightYellow, fontSize: 16),
                          ),
                        ),
                        const Spacer(
                          flex: 5,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              model.date,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 203, 210, 218)),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
