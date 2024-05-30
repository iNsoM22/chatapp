import 'package:flutter/material.dart';

class MyCustomBackgroudScaffold extends StatelessWidget {
  const MyCustomBackgroudScaffold({
    super.key,
    this.child,
    this.color = Colors.black,
    this.blendMode = BlendMode.darken,
    this.backgroundDarken = 0.1,
  });

  final double backgroundDarken;
  final Color color;
  final BlendMode blendMode;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg1.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(backgroundDarken),
              backgroundBlendMode: blendMode,
            ),
          ),
          SafeArea(child: child ?? Container())
        ],
      ),
    );
  }
}
