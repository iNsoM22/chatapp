import 'package:flutter/material.dart';
import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/buttons.dart';
import 'package:chatapp/components/auth/widgets/input_text_field.dart';
import 'package:chatapp/components/messages/widgets/message.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Username",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: MyIconButtonLayout(
          buttonIcon: Icons.arrow_back,
          iconSize: 30,
          onClick: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.26,
        child: Column(
          children: [
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: MyMessageSectionWidget(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height:
                          height * 0.08, // Dynamic height based on screen size
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextFormInputField(
                              textHint: "Say Hi",
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              prefixIcon: false,
                              bgColor: Colors.grey.shade300,
                              validatorCallback: (arg) {},
                            ),
                          ),
                          MyIconButtonLayout(
                            buttonIcon: Icons.send,
                            iconSize: 27,
                            iconColor: Colors.deepOrangeAccent,
                            iconWeight: FontWeight.w800,
                            onClick: () {},
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
