import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  const textFormField({
    super.key,
    required this.labelText,
    required this.icon,
  });

  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          iconColor: Colors.black,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black))),
    );
  }
}
