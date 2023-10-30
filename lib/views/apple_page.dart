import 'package:flutter/material.dart';

class ApplePage extends StatelessWidget {

  const ApplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Apple Page !!!')

            ],
          ),
        ),
      ),
    );
  }

}