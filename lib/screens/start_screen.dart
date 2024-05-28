import "package:flutter/material.dart";
import "../screens/login_screen.dart";
import "../screens/account_creation_screen.dart";
import "../widgets/buttons.dart";
import "../widgets/background_scaffold.dart";

class MyStartScreen extends StatelessWidget {
  const MyStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.53,
      child: Column(
        children: [
          const SizedBox(
            height: 190,
          ),
          Flexible(
            flex: 8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Voxello",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Create, Find, and Chat.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Flexible(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const MyAccountCreationScreen(),
                  ),
                ),
                child: const MyFormsButtonsLayout(
                  text: "Get Started",
                  bgColor: Colors.black,
                  fgColor: Colors.white,
                  height: 20,
                  width: 40,
                  roundedBorderRadius: 40,
                  boxShadow: true,
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 200,
            ),
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
                    MaterialPageRoute(
                      builder: (context) => const MyLoginScreen(),
                    )),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blueGrey.shade400,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
