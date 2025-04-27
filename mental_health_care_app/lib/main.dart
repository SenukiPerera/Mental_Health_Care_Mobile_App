import 'package:flutter/material.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';

const Color blueBackgroungColor = Color(0xFF4A90E2);
const Color lightBlueBackgroundColor = Color(0xFFEBF2FD);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
