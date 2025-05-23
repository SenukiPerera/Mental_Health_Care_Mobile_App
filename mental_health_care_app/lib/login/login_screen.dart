import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';
import 'package:mental_health_care_app/login/login_header_widget.dart';
import 'package:mental_health_care_app/login/login_footer_widget.dart';

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
                image: 'assets/images/Mindcare_logo.png',
                title: 'Welcome Back!',
                subtitle: 'Sign in to continue',
              ),
              SizedBox(
                height: 40,
              ),
              LoginForm(context),
              SizedBox(
                height: 20,
              ),
              LoginFooterWidget()
            ],
          ),
        )),
      ),
    );
  }
}

Form LoginForm(BuildContext context) {
  return Form(
      child: Column(
    children: [
      textFormField(
        labelText: 'Email',
        icon: Icons.email,
      ),
      SizedBox(
        height: 20,
      ),
      textFormField(
        labelText: 'Password',
        icon: Icons.lock,
      ),
      SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Text("Forgot Password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: blueBackgroungColor,
                ))),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/HomeScreen');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: blueBackgroungColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      )
    ],
  ));
}
