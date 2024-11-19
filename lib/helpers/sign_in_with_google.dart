// دالة لتسجيل الدخول باستخدام Google
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


 Future<void> signInWithGoogle(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    // خطوة 1: بدء تدفق المصادقة
    // TODO: للمستخدم Google  تظهر شاشة اختيار حساب
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // ToDO: لل شاشة الاختيار cancel فى حالة عملت
    if (googleUser == null) {
      return null;
    }

    // التحقق من بيانات الاعتماد

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // الحصول على بيانات الاعتماد وتسجيل الدخول
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await auth.signInWithCredential(credential);
    print("Signed in with Google: ${googleUser.email}");
    Navigator.of(context).pushNamed('HomePage');
  }