import 'package:flutter/material.dart';
import 'package:nutrihealth/screens/agenda_screen.dart';
import 'package:nutrihealth/screens/questionnari_screen.dart';
import 'package:nutrihealth/screens/mensajes_screen.dart';
import 'package:nutrihealth/screens/inicio_screen.dart';
import '../screens/setting_screen.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    Home(),//Inicio
    ChatScreen(), // Mensajes
    QuestionnaireScreen(),
    AgendaScreen(), // Agenda
    Settings(), // Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "Mensajes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: "Iniciar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_sharp),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_sharp),
              label: "Ajustes",
            ),
          ],
        ),
      ),
    );
  }
}
