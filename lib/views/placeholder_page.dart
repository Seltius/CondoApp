import 'package:condo_app/utils/auth_token.dart';
import 'package:condo_app/views/documents_page.dart';
import 'package:condo_app/views/home_page.dart';
import 'package:condo_app/views/settings_page.dart';
import 'package:condo_app/views/vote_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class PlaceHolderPage extends StatefulWidget {
  const PlaceHolderPage({super.key});

  @override
  State<PlaceHolderPage> createState() => _PlaceHolderPage();
}

class _PlaceHolderPage extends State<PlaceHolderPage>{
  AuthTokenUtils authTokenUtils = AuthTokenUtils();

  int currentIndex = 0;

  final navItems = const [
    Icon(Icons.home_outlined, size: 30),
    Icon(Icons.how_to_vote_outlined, size: 30),
    Icon(Icons.document_scanner_outlined, size: 30),
    Icon(Icons.settings_outlined, size: 30)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Welcome to Condominium"),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ListTile(
                title: Text('Assembleia'),
                leading: Icon(Icons.schedule),
              ),
              const ListTile(
                  title: Text('Anuncios'),
                leading: Icon(Icons.notifications),
              ),
              const ListTile(
                title: Text('Condominio'),
                leading: Icon(Icons.house),
              ),
              const ListTile(
                title: Text('Pagamentos'),
                leading: Icon(Icons.payment),
              ),
              const ListTile(
                title: Text('Reportar'),
                leading: Icon(Icons.report),
              ),
              const ListTile(
                title: Text('Administracao'),
                leading: Icon(Icons.admin_panel_settings),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.00),
                  child: ListTile(
                    title: const Text('Sair'),
                    leading: const Icon(Icons.login),
                    onTap: () => Navigator.pushNamed(context, '/login')
                  ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: [ // IMPORTANT - SAME AMOUNT AS CURVED_NAVIGATION_BAR
              const HomePage(),
              const VotePage(),
              const DocumentsPage(),
              const SettingsPage()
            ][currentIndex],
          )
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: currentIndex,
          height: 70,
          items: navItems,
          color: Colors.amber,
          buttonBackgroundColor: Colors.amber,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        )
      );
  }

}