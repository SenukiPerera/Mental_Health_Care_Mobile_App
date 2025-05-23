import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: blueBackgroungColor,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/LoginScreen');
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
