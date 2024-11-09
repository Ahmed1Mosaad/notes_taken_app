import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/widgets/custom_button.dart';
import 'package:notes_application/widgets/custom_text_form_field.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  width: double.infinity,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Hi, Welcome Back! 👋',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 40,
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
                const CustomeTextFormField(hintText: 'Enter Your Email Address'),
                SizedBox(
                  height: 12,
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
                const CustomeTextFormField(
                  hintText: 'Enter Your Password',
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.end,
                    'Forget Password?',
                    style: TextStyle(color: Colors.white.withOpacity(.8)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  color: orange,
                  text: 'Continue With Email',
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  color: black,
                  text: 'Continue with google',
                  image: 'assets/images/google.png',
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  color: black,
                  text: 'Continue with apple',
                  image: 'assets/images/apple-logo.png',
                ),
                SizedBox(
                  height: 20,
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
                        onPressed: () {},
                        child: Text('Sign Up'),
                        style: TextButton.styleFrom(foregroundColor: orange))
                  ],
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
