import "package:chatapp/widgets/chatbox_creator.dart";
import "package:chatapp/widgets/custom_appbar.dart";
import "package:chatapp/widgets/recent_avators.dart";
import "../widgets/background_scaffold.dart";
import "package:flutter/material.dart";

class MyChatHomePage extends StatelessWidget {
  const MyChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.74,
      child: SingleChildScrollView(
        child: Column(children: [
          MyCustomAppBar(
            height: height * 0.11,
            title: "Messages",
            titleSize: 30,
            titleColor: Colors.white,
            leadingWidget: Text(
              String.fromCharCode(Icons.menu.codePoint),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
                fontFamily: Icons.menu.fontFamily,
              ),
            ),
            trailingWidget: Text(
              String.fromCharCode(Icons.search.codePoint),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
                fontFamily: Icons.search.fontFamily,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
            indent: 30,
            endIndent: 30,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 7),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            height: height * 0.17,
            child: const MyRecentAvatarsRowWidget(),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding:
                const EdgeInsets.only(top: 4, left: 20, right: 10, bottom: 94),
            height: height * 0.79,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 5, 46, 51),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: const MyChatBoxCardsSectionCreator(),
          )
        ]),
      ),
    );
  }
}
