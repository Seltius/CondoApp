import 'package:flutter/material.dart';

class GooglePage extends StatelessWidget {

  const GooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('GOOGLE Page !!!')

            ],
          ),
        ),
      ),
    );
  }

}