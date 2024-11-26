// استيراد مكتبة Google Sign-In
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/helpers/show_snack_bar_method.dart';
import 'package:notes_application/helpers/sign_in_with_facebook.dart';
import 'package:notes_application/helpers/sign_in_with_google.dart';
import 'package:notes_application/widgets/custom_button.dart';
import 'package:notes_application/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  AutovalidateMode mode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 850,
            child: Form(
              key: formKey,
              autovalidateMode: mode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 26,
                  ),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Hi, Welcome Back! 👋',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Let's group your thoughts with just a few taps",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.4),
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                  //! Email
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomeTextFormField(
                    hintText: 'Enter Your Email Address',
                    onChanged: (String value) {
                      email = value;
                    },
                    validator: (String? value) {
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regExp = RegExp(pattern);
                      if (value!.isEmpty) {
                        return 'Please Enter your Email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'please Enter a valid Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  //! password
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomeTextFormField(
                    showenSuffixIcon: true,
                    obscureText: true,
                    hintText: 'Enter Your Password',
                    onChanged: (String value) {
                      password = value;
                    },
                    validator: (String? value) {
                      const String pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regExp = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return 'Please, enter your password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please, enter an valid password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.end,
                      'Forget Password?',
                      style: TextStyle(color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        setState(() {
                          mode = AutovalidateMode.always;
                        });
                      }

                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential userCredential =
                            await auth.signInWithEmailAndPassword(
                                email: email!, password: password!);
                        showSnackBarMethod(context,
                            text: 'Successful Sign Up',
                            color: Colors.cyan,
                            colorBorder: Colors.cyan);
                        Navigator.of(context).pushNamed('HomePage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBarMethod(context,
                              text: '❗ No user found for that email.',
                              color: const Color.fromARGB(255, 241, 110, 100),
                              colorBorder:
                                  const Color.fromARGB(255, 190, 19, 7));
                        } else if (e.code == 'wrong-password') {
                          showSnackBarMethod(context,
                              text: '❗ Wrong password provided for that user.',
                              color: const Color.fromARGB(255, 241, 110, 100),
                              colorBorder:
                                  const Color.fromARGB(255, 190, 19, 7));
                        }
                      }
                    },
                    color: orange,
                    text: 'Continue With Email',
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        endIndent: 20,
                        indent: 40,
                      )),
                      Text(
                        'Or coninue with',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.4),
                        ),
                      ),
                      const Expanded(
                          child: Divider(
                        indent: 20,
                        endIndent: 40,
                      )),
                    ],
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  CustomButton(
                    onPressed: () {
                      signInWithGoogle(context);
                    },
                    color: black,
                    text: 'Continue with google',
                    image: 'assets/images/google.png',
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  CustomButton(
                    onPressed: () {
                      signInWithFacebook();
                    },
                    color: black,
                    text: 'Continue with Facebook',
                    image: 'assets/images/facebook.png',
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.4),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('RegisterPage');
                        },
                        style: TextButton.styleFrom(foregroundColor: orange),
                        child: const Text('Sign Up'),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
