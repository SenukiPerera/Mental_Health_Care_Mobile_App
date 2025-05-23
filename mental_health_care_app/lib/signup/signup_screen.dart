import 'package:flutter/material.dart';
import 'package:mental_health_care_app/common%20widgets/form/form_header.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/signup/signup_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  bool agreedToTerms = false;
  String? selectedOption;

  final List<String> dementiaOptions = ['Yes', 'No'];

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

          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/logo_white.png', height: 60),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Create An Account To Access',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreedToTerms = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Agree with ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  onPressed: agreedToTerms ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4DA3FF),
                    textStyle: TextStyle(color: Colors.white),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or sign up with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: Image(
                      image: AssetImage('assets/images/google.png'),
                      width: 24,
                      height: 24),
                  label: Text("Sign In with Google",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: Colors.blue,
                    ), // blue border
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/LoginScreen');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
