import 'package:condo_app/utils/auth_token.dart';
import 'package:condo_app/views/apple_page.dart';
import 'package:condo_app/views/documents_page.dart';
import 'package:condo_app/views/google_page.dart';
import 'package:condo_app/views/login_page.dart';
import 'package:condo_app/views/placeholder_page.dart';
import 'package:condo_app/views/recover_page.dart';
import 'package:condo_app/views/register_page.dart';
import 'package:condo_app/views/settings_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAuthenticated = await AuthTokenUtils.isAuthenticated();
  runApp(MyApp(isAuthenticated: isAuthenticated));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
  const MyApp({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isAuthenticated ? const PlaceHolderPage() : const LoginPage(),
      routes: {
        '/homepage': (context) => const PlaceHolderPage(),
        '/register': (context) => const RegisterPage(),
        '/recover': (context) => const RecoverPage(),
        '/documents': (context) => const DocumentsPage(),
        '/settings': (context) => const SettingsPage(),
        '/apple': (context) => const ApplePage(),
        '/google': (context) => const GooglePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }

  //TODO
  // Validate all input fields
  // Handle api error's

}