import 'package:chatapp/widgets/background_scaffold.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/custom_appbar.dart';
import 'package:chatapp/widgets/input_text_field.dart';
import 'package:chatapp/widgets/message.dart';
import 'package:flutter/material.dart';

class MyChatScreenUI extends StatefulWidget {
  const MyChatScreenUI({super.key});

  @override
  State<MyChatScreenUI> createState() => _MyChatScreenUIState();
}

class _MyChatScreenUIState extends State<MyChatScreenUI> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.7,
      color: Color.fromARGB(255, 5, 46, 51),
      blendMode: BlendMode.difference,
      child: Column(
        children: [
          MyCustomAppBar(
            height: height * 0.08,
            title: "Username",
            titleColor: Colors.white,
            leadingWidget: MyIconButtonLayout(
              buttonIcon: Icons.arrow_back,
              iconSize: 30,
              onClick: () => Navigator.pop(context),
            ),
          ),
          const Divider(
            height: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.white,
          ),
          Expanded(
            flex: 10,
            child: Container(
              decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 5, 46, 51),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                // backgroundBlendMode: BlendMode.difference,
              ),
              child: Column(
                children: [
                  const Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: MyMessageSectionWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 2, bottom: 15, right: 7, left: 7),
                    child: Row(
                      children: [
                        const Expanded(
                          child: MyTextInputField(
                            textHint: "Say Hi",
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            prefixIcon: false,
                          ),
                        ),
                        const SizedBox(width: 8),
                        MyIconButtonLayout(
                          buttonIcon: Icons.send,
                          iconSize: 27,
                          iconColor: Colors.deepOrangeAccent,
                          iconWeight: FontWeight.w800,
                          onClick: () {
                            // Add send message logic here
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
