import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  final List<int?> answers;
  const ResultScreen({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    int score = answers.whereType<int>().fold(0, (a, b) => a + b);

    String feedback;
    if (score <= 7) {
      feedback = "Minimal or no depression";
    } else if (score <= 14) {
      feedback = "Mild depression";
    } else if (score <= 21) {
      feedback = "Moderate depression";
    } else {
      feedback = "Severe depression";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Result"),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Score: $score",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                feedback,
                style: const TextStyle(fontSize: 20, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Back to Test"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
