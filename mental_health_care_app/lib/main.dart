import 'package:flutter/material.dart';
import 'package:mental_health_care_app/Splash_Screen/splashscreen.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/login/login_screen.dart';
import 'package:mental_health_care_app/signup/signup_screen.dart';
import 'package:mental_health_care_app/welcome/welcome_screen.dart';
import 'package:mental_health_care_app/forgotpassword/ForgotPasswordScreen.dart'; // Update path if needed

// Theme Colors
const Color blueBackgroungColor = Color(0xFF4A90E2);
const Color lightBlueBackgroundColor = Color(0xFFEBF2FD);

void main() {
  // Uncomment when Firebase is added
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindCare App',
      theme: ThemeData(
        primaryColor: blueBackgroungColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/HomeScreen': (context) => const HomePage(),
        '/SignupScreen': (context) => SignUpScreen(),
        '/WelcomeScreen': (context) => WelcomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/ForgotPassword': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
