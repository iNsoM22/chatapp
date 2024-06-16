import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatapp/components/auth/screens/account_creation_screen.dart';
import 'package:chatapp/components/auth/screens/login_screen.dart';
import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/buttons.dart';

class MyStartScreen extends StatelessWidget {
  const MyStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.27),
            const Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Voxello",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Create, Find, and Chat.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: const MyAccountCreationScreen(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 400),
                ),
              ),
              child: MyTextButtonLayout(
                text: "Get Started",
                bgColor: Colors.black,
                fgColor: Colors.white,
                height: 25,
                width: width * 0.2,
                roundedBorderRadius: 40,
                boxShadow: true,
              ),
            ),
            SizedBox(height: height * 0.11),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already a User, ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: const MyLoginScreen(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 400),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Color.fromARGB(255, 91, 173, 213),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
