import 'package:flutter/material.dart';
import 'package:testing_apis_of_imagify_app/Widget/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthTextField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            hintText: 'Email',
            prefixIcon: Icons.email,
          ),
        ],
      ),
    );
  }
}
