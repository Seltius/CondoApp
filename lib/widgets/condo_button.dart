import 'package:flutter/material.dart';

class CondoButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CondoButton({
    super.key, 
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            fixedSize: MaterialStateProperty.all<Size>(const Size(300, 56)),
            elevation: MaterialStateProperty.all<double>(5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black))
            )
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white))
    );
  }
}
