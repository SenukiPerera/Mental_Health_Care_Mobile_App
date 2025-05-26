import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Navigate to home if login is successful
        Navigator.pushNamed(context, '/HomeScreen');
      } on FirebaseAuthException catch (e) {
        String message = '';
        switch (e.code) {
          case 'user-not-found':
            message = 'No user found for that email.';
            break;
          case 'wrong-password':
            message = 'Wrong password provided.';
            break;
          default:
            message = 'Login failed. Please try again.';
        }

        // Show snackbar with error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textFormField(
            controller: _emailController,
            labelText: 'Email',
            icon: Icons.email,
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter your email' : null,
          ),
          const SizedBox(height: 20),
          textFormField(
            controller: _passwordController,
            labelText: 'Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter your password' : null,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: blueBackgroungColor,
            ),
            child: TextButton(
              onPressed: _login,
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
