import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/Splash_Screen/splashscreen.dart';
import 'package:mental_health_care_app/firebase_options.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/login/login_screen.dart';
import 'package:mental_health_care_app/repository/user_repository/user_repository.dart';
import 'package:mental_health_care_app/signup/signup_screen.dart';
import 'package:mental_health_care_app/solution/solutionHome.dart';

import 'package:mental_health_care_app/welcome/welcome_screen.dart';
import 'package:mental_health_care_app/forgotpassword/ForgotPasswordScreen.dart'; // Update path if neede
import 'package:mental_health_care_app/screens/resources_screen.dart';
import 'package:mental_health_care_app/screens/depression_test_screen.dart';
import 'package:get/get.dart'; // Add this import for GetX
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart'; // Make sure this path is correct

// Theme Colors
const Color blueBackgroungColor = Color(0xFF4A90E2);
const Color lightBlueBackgroundColor = Color(0xFFEBF2FD);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(UserRepository()); // Register repository here

  Get.put(AuthenticationRepositiry()); // Put your repo before runApp

  // Uncomment when Firebase is added
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
        '/resources': (context) => const ResourcesScreen(),
        '/depression-test': (context) => const DepressionTestScreen(),
        '/solution': (context) => const Solutions(),
      },
    );
  }
}
