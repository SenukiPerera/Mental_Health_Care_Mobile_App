import 'package:flutter/material.dart';

class login_header_widget extends StatelessWidget {
  const login_header_widget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(image)),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
