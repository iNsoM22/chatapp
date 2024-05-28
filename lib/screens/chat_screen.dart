import "package:chatapp/widgets/background_scaffold.dart";
import "package:chatapp/widgets/buttons.dart";
import "package:chatapp/widgets/custom_appbar.dart";
import "package:flutter/material.dart";

class MyChatScreenUI extends StatefulWidget {
  const MyChatScreenUI({super.key});

  @override
  State<MyChatScreenUI> createState() => _MyChatScreenUIState();
}

class _MyChatScreenUIState extends State<MyChatScreenUI> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.78,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCustomAppBar(
            height: height * 0.12,
            title: "Username",
            titleColor: Colors.white,
            leadingWidget: MyAppBarButtonLayout(
              buttonIcon: Icons.arrow_back,
              iconSize: 30,
              onClick: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
