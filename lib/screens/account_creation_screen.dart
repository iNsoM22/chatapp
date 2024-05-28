import "package:flutter/material.dart";
import "../widgets/buttons.dart";
import "../widgets/input_text_field.dart";
import "../widgets/background_scaffold.dart";

class MyAccountCreationScreen extends StatefulWidget {
  const MyAccountCreationScreen({super.key});

  @override
  State<MyAccountCreationScreen> createState() =>
      _MyAccountCreationScreenState();
}

class _MyAccountCreationScreenState extends State<MyAccountCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.52,
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, left: 18, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 36,
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
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          const MyTextInputField(
                            prefixIcon: true,
                            imagePath: "assets/icons/user.png",
                            textHint: "Username",
                            keyboardType: TextInputType.name,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const MyTextInputField(
                            prefixIcon: true,
                            imagePath: "assets/icons/mail.png",
                            textHint: "Email",
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const MyTextInputField(
                            prefixIcon: true,
                            imagePath: "assets/icons/lock.png",
                            textHint: "Password",
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const MyFormsButtonsLayout(
                            text: "Let's Chat",
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
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a User, ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, '/login'),
                          child: Text(
                            "Sign In now.",
                            style: TextStyle(
                              color: Colors.blueGrey.shade400,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
