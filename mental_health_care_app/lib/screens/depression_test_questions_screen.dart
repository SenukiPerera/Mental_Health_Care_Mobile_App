import 'package:flutter/material.dart';
import 'package:mental_health_care_app/screens/result_screen.dart';


class DepressionTestQuestionsScreen extends StatefulWidget {
  const DepressionTestQuestionsScreen({super.key});

  @override
  State<DepressionTestQuestionsScreen> createState() =>
      _DepressionTestQuestionsScreenState();
}

class _DepressionTestQuestionsScreenState
    extends State<DepressionTestQuestionsScreen> {
  final List<String> questions = [
    "1. How often do you feel sad or down?",
    "2. Do you struggle to enjoy things you once liked?",
    "3. Do you feel tired or have little energy?",
    "4. Do you have trouble falling or staying asleep?",
    "5. Do you have changes in appetite or weight?",
    "6. Do you feel worthless or guilty?",
    "7. Do you have difficulty concentrating?",
    "8. Do you feel restless or slowed down?",
    "9. Have you had thoughts of self-harm or suicide?",
    "10. Do you feel hopeless about the future?",
  ];

  final List<String> options = [
    "Never",
    "Sometimes",
    "Rather Often",
    "Most of the time"
  ];

  int currentQuestionIndex = 0;
  List<int?> answers = List.filled(10, null);

  void selectAnswer(int selectedOption) {
    setState(() {
      answers[currentQuestionIndex] = selectedOption;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(answers: answers),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Depression Test"),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => selectAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    options[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
