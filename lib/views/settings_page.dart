import 'package:flutter/material.dart';

class SettingsPage  extends StatelessWidget {

  const SettingsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Settings Page !!!')

            ],
          ),
        ),
      ),
    );
  }

}