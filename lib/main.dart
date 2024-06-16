import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chatapp/components/auth/screens/account_creation_screen.dart';
import 'package:chatapp/components/messages/screens/chat_screen.dart';
import 'package:chatapp/components/home/screens/homepage_screen.dart';
import 'package:chatapp/components/auth/screens/login_screen.dart';
import 'package:chatapp/components/profile/screens/profile_screen.dart';
import 'package:chatapp/components/splash_screen/screens/start_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ujbexzuqsgadyjpbdoyz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqYmV4enVxc2dhZHlqcGJkb3l6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY3MjMyNTAsImV4cCI6MjAzMjI5OTI1MH0.wjAFYWGHAhSEymCc9WD6FIvwn3dkoMaKKrkl0G-vS4E',
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
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
