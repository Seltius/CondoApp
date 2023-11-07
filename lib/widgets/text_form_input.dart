import 'package:flutter/material.dart';

class InputFormTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;

  const InputFormTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
            ),
          hintText: hintText,
        ),
      ),
    );
  }

}