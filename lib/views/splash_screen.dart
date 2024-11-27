import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/views/home_page.dart';
import 'package:notes_application/views/login_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    //* Initialize the animation controller
    //* Initialize the scale animation
    _initAnimation();
    //* Repeat the animation
    _repeatAnimation();
    //* Delay the navigation to the next screen
    _delayAndNavigationToNaxtView();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Image.asset(
                    'assets/images/splash.png',
                    height: 160,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Notes App',
              style: TextStyle(
                color: Color(0xFFea3a3a),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _delayAndNavigationToNaxtView() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return FutureBuilder(
          future: _checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        );
      }));
    });
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
  }

  void _repeatAnimation() {
    // Repeat the animation
    _animationController.repeat(reverse: true);
  }
}

Future<bool> _checkLoginStatus() async {
  final user = FirebaseAuth.instance.currentUser; // ? يحصل على المستخدم الحالي
  return user != null;
}
