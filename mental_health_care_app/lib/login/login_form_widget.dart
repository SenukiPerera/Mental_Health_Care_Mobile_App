import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          textFormField(
            labelText: 'Email',
            icon: Icons.email,
          ),
          const SizedBox(
            height: 20,
          ),
          textFormField(
            labelText: 'Password',
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: blueBackgroungColor,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HomeScreen');
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
