import 'package:flutter/material.dart';

class CondoButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CondoButton({
    super.key, 
    required this.text,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )),
    );
  }
}