import 'package:flutter/material.dart';

class CondoButton extends StatelessWidget {
  final String text;

  const CondoButton({
    super.key, 
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ));
  }
}
