import 'package:condo_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/condo_button.dart';
import '../widgets/input_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => Register();

}


class Register extends State<RegisterPage> {
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo
              Image.asset('lib/images/logo.png', height: 100),

              // Title
              const Text(
                'Registro Condominium',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),

              // SubTitle
              Text(
                'Crie a sua conta e aceda ao seu condomio',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              //Input E-Mail
              InputTextField(
                  controller: authController.firstName,
                  hintText: 'Nome',
                  obscureText: false),

              const SizedBox(height: 8),

              InputTextField(
                  controller: authController.lastName,
                  hintText: 'Apelido',
                  obscureText: false),

              const SizedBox(height: 8),

              //Input E-Mail
              InputTextField(
                  controller: authController.email,
                  hintText: 'E-Mail',
                  obscureText: false),

              const SizedBox(height: 8),

              //Input Password
              InputTextField(
                  controller: authController.password,
                  hintText: 'Password',
                  obscureText: true),

              const SizedBox(height: 20),

              CondoButton(
                text: 'Registar',
                onPressed: () async {
                  if(await authController.register(context)) {
                    Navigator.pushNamed(context, '/homepage');
                  }
                },
              ),
            ],
          ),
        )
      ),
    );
  }

}