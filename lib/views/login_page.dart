import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import '../widgets/condo_button.dart';
import '../widgets/square_tile.dart';
import '../widgets/text_form_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  final pwRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

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

              Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      InputFormTextField(
                        controller: authController.email,
                        hintText: "E-Mail",
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo obrigatório";
                          } else if (!emailRegex.hasMatch(value)) {
                            return "E-Mail inválido";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      InputFormTextField(
                        controller: authController.password,
                        hintText: "Password",
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo obrigatório";
                          } else if (!pwRegex.hasMatch(value)) {
                            return "Password inválida";
                          }
                          return null;
                        },
                      ),

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
                      CondoButton(
                        text: 'Entrar',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if(await authController.login(context)) {
                              Navigator.pushNamedAndRemoveUntil(context, '/homepage', (Route<dynamic> route) => false);
                            }
                          }
                        },
                      ),
                    ],
                  )

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