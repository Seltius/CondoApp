import 'package:flutter/material.dart';

class VotePage  extends StatelessWidget {

  const VotePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Vote Page !!!')

            ],
          ),
        ),
      ),
    );
  }

}