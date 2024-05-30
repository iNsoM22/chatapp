import "package:chatapp/widgets/background_scaffold.dart";
import "package:flutter/material.dart";

class MyAccountProfileScreen extends StatefulWidget {
  const MyAccountProfileScreen({super.key});

  @override
  State<MyAccountProfileScreen> createState() => _MyAccountProfileScreenState();
}

class _MyAccountProfileScreenState extends State<MyAccountProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MyCustomBackgroudScaffold(
      child: Center(
        child: Text("Profile"),
      ),
    );
  }
}
