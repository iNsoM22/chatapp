import "package:chatapp/screens/Forms/account_creation_screen.dart";
import "package:chatapp/widgets/background_interface.dart";
import "package:chatapp/widgets/buttons.dart";
import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";
import "Forms/login_screen.dart";

class MyStartScreen extends StatelessWidget {
  const MyStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.4,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.27,
            ),
            const Expanded(
              flex: 8,
              child: Column(
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
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                ),
              ),
              child: const MyFormsButtonsLayout(
                text: "Get Started",
                bgColor: Colors.black,
                fgColor: Colors.white,
                height: 25,
                width: 50,
                roundedBorderRadius: 40,
                boxShadow: true,
              ),
            ),
            SizedBox(
              height: height * 0.11,
            ),
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
                        duration: const Duration(
                          milliseconds: 400,
                        )),
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
                )
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
