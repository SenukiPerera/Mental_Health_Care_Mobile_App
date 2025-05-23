import 'package:flutter/material.dart';
import 'package:mental_health_care_app/login/login_form_widget.dart';
import 'package:mental_health_care_app/login/login_footer_widget.dart';
import 'package:mental_health_care_app/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              login_header_widget(
                image:
                    'assets/images/Mindcare_logo.png', // Replace with your actual image path
                title: 'Welcome Back!',
                subtitle: 'Sign in to continue',
              ),
              SizedBox(
                height: 40,
              ),
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              loginFooterWidget()
            ],
          ),
        )),
      ),
    );
  }
}
