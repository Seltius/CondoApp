import 'package:condo_app/controllers/auth_controller.dart';
import 'package:condo_app/widgets/text_form_input.dart';
import 'package:flutter/material.dart';

import '../widgets/condo_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();

}


class _RegisterPageState extends State<RegisterPage> {
  AuthController authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  final nameRegex = RegExp(r'^[a-zA-Z\u00C0-\u017F]+(-[a-zA-Z\u00C0-\u017F]+)*( [a-zA-Z\u00C0-\u017F]+(-[a-zA-Z\u00C0-\u017F]+)*)*$');
  final emailRegex = RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  final pwRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

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

              const SizedBox(height: 32),

              Form(
                key: _formKey,
                child: Column(
                  children: [

                    //firstName field
                    InputFormTextField(
                      controller: authController.firstName,
                      hintText: "Nome",
                      isPassword: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        } else if (!nameRegex.hasMatch(value)) {
                          return "Nome inválido";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    InputFormTextField(
                      controller: authController.lastName,
                      hintText: "Apelido",
                      isPassword: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        } else if (!nameRegex.hasMatch(value)) {
                          return "Apelido inválido";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

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
                          return "Password não cumpre os requisitos";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 32),

                    CondoButton(
                      text: 'Registar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if(await authController.register(context)) {
                            Navigator.pushNamedAndRemoveUntil(context, '/homepage', (Route<dynamic> route) => false);
                          }
                        }
                      },
                    ),
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }

}