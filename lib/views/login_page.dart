import 'package:condo_app/widgets/MyButton.dart';
import 'package:flutter/material.dart';

import '../widgets/InputTextField.dart';
import '../widgets/SquareTile.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 16),

              // Logo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('lib/images/logo.png', height: 200),
              ),

              // Title
              const Text(
                'Bem-vindo ao Condominium',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),

              // SubTitle
              Text(
                'Gestao de condomínio simples e transparente',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              //Input E-Mail
              InputTextField(
                controller: emailController,
                hintText: 'E-Mail',
                obscureText: false),

              const SizedBox(height: 8),

              //Input Password
              InputTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),

              //sign-in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/recover'),
                      child: const Text(
                          'Recuperar Password',
                          style: TextStyle(
                              color: Colors.black
                          ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // SignIn button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: MyButton(
                  text: 'Entrar',
                  onTap: () => Navigator.pushNamed(context, '/homepage'),
                ),
              ),

              const SizedBox(height: 24),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Ou continuar com',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // SSO buttons (google + apple)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 25),

                  // apple
                  SquareTile(imagePath: 'lib/images/apple.png'),

                  SizedBox(width: 25),

                  // apple
                  SquareTile(imagePath: 'lib/images/facebook.png')
                ],
              ),

              const SizedBox(height: 24),

              // Registration
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ainda nao e membro?',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      'Registar',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

}