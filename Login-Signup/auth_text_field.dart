import 'package:flutter/material.dart';

class Auth_text_field extends StatelessWidget {
  final String text;
  final String icon;
  final TextEditingController? controller;
  final bool isPassword;

  const Auth_text_field({super.key, 
    required this.text,
    required this.icon,
    this.controller,
    this.isPassword = false, // Default value set to false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword, // Hide text if it's a password field
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Image.asset(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
