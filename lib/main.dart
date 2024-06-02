import "package:chatapp/screens/Forms/account_creation_screen.dart";
import "package:chatapp/screens/Dashboard/Chats/chat_screen.dart";
import "package:chatapp/screens/Dashboard/homepage_screen.dart";
import "package:chatapp/screens/Forms/login_screen.dart";
import "package:chatapp/screens/Dashboard/Account/profile_screen.dart";
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
        '/chatbox:id': (context) => const MyChatScreenUI(),
        '/profile': (context) => const MyAccountProfileScreen(),
      },
    );
  }
}
