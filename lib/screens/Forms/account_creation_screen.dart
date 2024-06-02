import "package:chatapp/screens/Forms/login_screen.dart";
import "package:chatapp/screens/start_screen.dart";
import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";
import "../../widgets/buttons.dart";
import "../../widgets/input_text_field.dart";
import "../../widgets/background_scaffold.dart";
import "../../widgets/custom_appbar.dart";

class MyAccountCreationScreen extends StatefulWidget {
  const MyAccountCreationScreen({super.key});

  @override
  State<MyAccountCreationScreen> createState() =>
      _MyAccountCreationScreenState();
}

class _MyAccountCreationScreenState extends State<MyAccountCreationScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.52,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 18, right: 20, bottom: 20),
        child: Column(
          children: [
            MyCustomAppBar(
              height: height * 0.13,
              horizontalPadding: 5,
              leadingWidget: MyIconButtonLayout(
                buttonIcon: Icons.arrow_back,
                onClick: () => Navigator.pop(context),
                iconSize: 25,
                iconWeight: FontWeight.w700,
              ),
            ),
            const ListTile(
              title: Text("Sign Up"),
              subtitle: Text("Simple and easy."),
              titleTextStyle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 42,
                fontWeight: FontWeight.w800,
              ),
              subtitleTextStyle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextInputField(
                    prefixIcon: true,
                    imagePath: "assets/icons/user.png",
                    textHint: "Username",
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    bgColor: Colors.grey.shade200,
                    padH: 0,
                    padV: 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextInputField(
                    prefixIcon: true,
                    imagePath: "assets/icons/mail.png",
                    textHint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    bgColor: Colors.grey.shade200,
                    obscureText: false,
                    padH: 0,
                    padV: 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextInputField(
                    prefixIcon: true,
                    imagePath: "assets/icons/lock.png",
                    textHint: "Password",
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    bgColor: Colors.grey.shade200,
                    padH: 0,
                    padV: 0,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  MyFormsButtonsLayout(
                    text: "Sign Up",
                    bgColor: Colors.black,
                    fgColor: Colors.white,
                    width: 100,
                    height: 10,
                    boxShadow: true,
                    suffixIcon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: const MyStartScreen(),
                        type: PageTransitionType.fade,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      ),
                      (route) => false,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an Account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const MyLoginScreen(),
                        type: PageTransitionType.fade,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up Now.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 91, 173, 213),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
