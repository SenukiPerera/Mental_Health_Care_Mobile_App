import 'package:flutter/material.dart';

class EmojiFaces extends StatelessWidget {
  const EmojiFaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '😊',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Happy',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
      const SizedBox(width: 22),
      Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFB0B0B0),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '😐',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Neutral',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
      const SizedBox(width: 22),
      Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF7EC8E3),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '😢',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sad',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
      const SizedBox(width: 22),
      Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFC4A3E8),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              '😟',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Anxious',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ]);
  }
}
