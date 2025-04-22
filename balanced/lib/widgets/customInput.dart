
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final IconData suffixIcon;
  final bool obscure;

  const CustomInputField({
    super.key,
    required this.hint,
    required this.suffixIcon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        suffixIcon: Icon(suffixIcon, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
