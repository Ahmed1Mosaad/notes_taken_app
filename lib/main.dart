import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/views/content_note.dart';
import 'package:notes_application/views/edit_note_screen.dart';
import 'package:notes_application/views/home_page.dart';
import 'package:notes_application/views/login_page.dart';
import 'package:notes_application/views/registeration_page.dart';
import 'package:notes_application/widgets/show_modal_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext conetxt) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: black,
          fontFamily: 'Lufga',
          brightness: Brightness.dark),
      home: HomePage(),

      routes: {
        'LoginPage': (context) {
          return LoginPage();
        },
        'RegisterPage': (conetxt) {
          return RegisterPage();
        },
        'HomePage':(context)=> HomePage(),
        'ContentPage': (context)=> ContentNote(),
        'EditNoteScreen':(context)=> EditNoteScreen(),
      },
    );
  }
}
