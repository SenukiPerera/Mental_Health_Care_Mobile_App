import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';

class loginFooterWidget extends StatelessWidget {
  const loginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR"),
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
              side: BorderSide(color: blueBackgroungColor), // blue border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // rounded corners
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SignupScreen');
            },
            child: Text.rich(
              TextSpan(
                text: "Don’t have an account?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "\u00A0Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blueBackgroungColor,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
