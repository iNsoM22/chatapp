import "package:chatapp/screens/account_creation_screen.dart";
import "package:chatapp/screens/chat_screen.dart";
import "package:chatapp/screens/homepage_screen.dart";
import "package:chatapp/screens/login_screen.dart";
import "package:chatapp/screens/start_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      routes: {
        '/': (context) => const MyStartScreen(),
        '/chatHomePage': (context) => const MyChatHomePage(),
        '/login': (context) => const MyLoginScreen(),
        '/signup': (context) => const MyAccountCreationScreen(),
        '/chatbox:id': (context) => const MyChatScreenUI()
      },
    );
  }
}
