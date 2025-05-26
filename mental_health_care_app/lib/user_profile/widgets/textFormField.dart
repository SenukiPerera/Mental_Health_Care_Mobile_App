import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  const textFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.initialValue,
    this.validator,
  });

  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        iconColor: Colors.black,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}
