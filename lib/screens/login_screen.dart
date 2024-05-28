import "package:chatapp/screens/homepage_screen.dart";
import "package:chatapp/widgets/custom_appbar.dart";
import "package:flutter/material.dart";
import "../widgets/buttons.dart";
import "../widgets/input_text_field.dart";
import "../widgets/background_scaffold.dart";

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.57,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyCustomAppBar(
              height: height * 0.13,
              horizontalPadding: 22,
              leadingWidget: MyIconButtonLayout(
                buttonIcon: Icons.arrow_back,
                onClick: () => Navigator.pop(context),
                iconSize: 25,
                iconWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 18, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: "\nSimple and easy.",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const MyTextInputField(
                        prefixIcon: true,
                        imagePath: "assets/icons/user.png",
                        textHint: "Username",
                        keyboardType: TextInputType.name,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const MyTextInputField(
                        prefixIcon: true,
                        imagePath: "assets/icons/lock.png",
                        textHint: "Password",
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyChatHomePage(),
                          ),
                          (route) => false,
                        ),
                        child: const MyFormsButtonsLayout(
                          text: "Sign in",
                          bgColor: Colors.black,
                          fgColor: Colors.white,
                          width: 100,
                          height: 10,
                          boxShadow: true,
                          suffixIcon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.33),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account, ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.popAndPushNamed(context, '/signup'),
                            child: Text(
                              "Sign Up now.",
                              style: TextStyle(
                                color: Colors.blueGrey.shade400,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
