import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/helpers/show_snack_bar_method.dart';
import 'package:notes_application/widgets/custom_button.dart';
import 'package:notes_application/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode mode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 830,
            child: Form(
              key: formKey,
              autovalidateMode: mode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 15,
                  ),
                  Container(
                      width: double.infinity,
                      child: const Text(
                        'Sign Up For Free',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Quickly make your account in 1 minute",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.4),
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const Spacer(
                    flex: 5,
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
                      if (value!.isEmpty || value == null) {
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
                  const Spacer(
                    flex: 3,
                  ),
                  //! confirm password
                  const Text(
                    'Confirm Password',
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
                    validator: (String? value) {
                      const String pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regExp = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return 'Please, enter your password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please, enter an valid password';
                      }
                      if (password != value) {
                        return 'Password don\'t match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Spacer(
                    flex: 5,
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
                            await auth.createUserWithEmailAndPassword(
                                email: email!.trim(), password: password!);

                        showSnackBarMethod(context,
                            text: 'Successful Sign Up',
                            color: Colors.cyan,
                            colorBorder: Colors.cyan);
                            Navigator.of(context).pushNamed('LoginPage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBarMethod(context,
                              text: '❗ The password provided is too weak.',
                              color: const Color.fromARGB(255, 241, 110, 100),
                              colorBorder:
                                  const Color.fromARGB(255, 190, 19, 7));
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBarMethod( context,
                              text:
                                  '❗The account already exists for that email.',
                              color: const Color.fromARGB(255, 241, 110, 100),
                              colorBorder:
                                  const Color.fromARGB(255, 190, 19, 7));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: orange,
                    text: 'Sign Up ',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.4),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('LoginPage');
                        },
                        style: TextButton.styleFrom(foregroundColor: orange),
                        child: const Text(
                          'Sign in.',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 13,
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
