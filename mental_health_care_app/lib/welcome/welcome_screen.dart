import 'package:flutter/material.dart';
import '../main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage('assets/images/onboarding_image.png')),
                Column(
                  children: [
                    Text("Welcome To MindCare",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    Text("Your safe space for mental wellness.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 46,
                            child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/LoginScreen');
                                },
                                style: OutlinedButton.styleFrom(
                                    side:
                                        BorderSide(color: blueBackgroungColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Text("Sign In",
                                    style: TextStyle(
                                        color: blueBackgroungColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))))),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: SizedBox(
                            height: 46,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/SignupScreen');
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: blueBackgroungColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))))),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
