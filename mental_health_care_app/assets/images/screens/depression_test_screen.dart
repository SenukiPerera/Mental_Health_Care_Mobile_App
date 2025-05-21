import 'package:flutter/material.dart';

class DepressionTestScreen extends StatelessWidget {
  const DepressionTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depression Test'),
        backgroundColor: Color(0xFF4A90E2),
      ),
      body: const Center(
        child: Text(
          'This is the Depression Test Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
