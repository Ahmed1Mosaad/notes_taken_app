import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// دالة لتسجيل الدخول باستخدام الفيسبوك
Future<void> signInWithFacebook() async {
  try {
    // تشغيل عملية تسجيل الدخول عبر الفيسبوك
    final LoginResult loginResult = await FacebookAuth.instance.login();

    //صالح accessToken إذا كانت عملية الدخول ناجحة وكان هناك  
    if (loginResult.status == LoginStatus.success && loginResult.accessToken != null) {
      
      // OAuth باستخدام accessTokenإنشاء اعتماد 
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // تسجيل الدخول باستخدام الاعتماد الذي تم إنشاؤه
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      // إذا فشلت عملية تسجيل الدخول، طباعة رسالة الخطأ
      print('Facebook login failed: ${loginResult.message}');
    }
  } catch (e) {
    // في حالة حدوث أي خطأ أثناء عملية الدخول، سيتم طباعة الخطأ
    print('Error during Facebook sign-in: $e');
  }
}