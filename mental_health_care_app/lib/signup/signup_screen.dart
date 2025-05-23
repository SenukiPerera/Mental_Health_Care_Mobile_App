import 'package:flutter/material.dart';
import 'package:mental_health_care_app/common%20widgets/form/form_header.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/signup/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: 'assets/images/Mindcare_logo.png',
                  title: "Sign Up",
                  subtitle: "create an account to access",
                ),
                signup_form_widget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: Image(
                            image: AssetImage('assets/images/google.png'),
                            width: 24,
                            height: 24),
                        label: Text("Sign In with Google",
                            style: TextStyle(
                                color: blueBackgroungColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: BorderSide(
                              color: blueBackgroungColor), // blue border
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // rounded corners
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/LoginScreen');
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "\u00A0Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: blueBackgroungColor,
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
