import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  const textFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.controller,
    this.isPassword = false,
    this.initialValue,
  });

  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
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
