import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  bool useFaceRecognition = false;
  bool signInAsGuest = false;

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
              login_header_widget(),
              SizedBox(
                height: 40,
              ),
              LoginForm(context),
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
              onPressed: () {
                Navigator.pushNamed(context, '/ForgotPassword');
              },
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
}

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

class login_header_widget extends StatelessWidget {
  const login_header_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/Mindcare_logo.png')),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text("Sign In",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            Text("Create an account to access",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ],
        ),
      ],
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/images/logo_white.png', height: 60),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ForgotPassword');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/HomeScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4DA3FF),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or sign in with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Image(
                    image: AssetImage('assets/images/google.png'),
                    width: 24,
                    height: 24,
                  ),
                  label: const Text(
                    "Sign In with Google",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    // TODO: Add Google Sign-In logic
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/SignupScreen');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
