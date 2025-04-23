
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  //final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    //required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _signUpPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFB06AB3), // Texte
          backgroundColor: Colors.white, // Fond bouton
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        child: Text(label.toUpperCase()),
      ),
    );
  }
}
void _signUpPressed() {
  // À remplacer plus tard par la logique d'inscription
  debugPrint("Sign Up button pressed");
}
