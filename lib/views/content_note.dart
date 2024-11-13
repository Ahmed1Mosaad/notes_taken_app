import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/two_lines.dart';

class ContentNote extends StatelessWidget {
  const ContentNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightYellow,
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
      backgroundColor: lightYellow,
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
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                            child: TwoLines(
                          color: lightYellow,
                        )),
                        Spacer(),
                        Center(
                          child: Text(
                            'My Lectures',
                            style: TextStyle(
                                color: gold,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Content Content ContenlightYellow,t Content Content Content Content Content Content Content Content Content ',
                            style: TextStyle(color: lightYellow, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(
                              '31-3-2001',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 203, 210, 218)),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
