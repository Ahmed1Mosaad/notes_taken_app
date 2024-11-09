import 'package:flutter/material.dart';
import 'package:notes_application/views/login_page.dart';
import 'package:notes_application/views/login_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext conetxt) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Lufga',
        brightness: Brightness.dark
      ),
      home:  Loginpage(),
    );
  }
}

/*v
 @@ splash screen
 @@ onboarding screen
 @@  
*/
