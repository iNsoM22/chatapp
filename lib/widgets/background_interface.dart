import "package:flutter/material.dart";

/// This Class will create a background layout with the Image provided.
/// Also all the screens using this should pass their widgets to the child of this class.

class MyCustomBackgroundStackWidget extends StatelessWidget {
  const MyCustomBackgroundStackWidget({
    super.key,
    required this.child,
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
    return Stack(
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
        SafeArea(maintainBottomViewPadding: false, child: child ?? Container())
      ],
    );
  }
}
