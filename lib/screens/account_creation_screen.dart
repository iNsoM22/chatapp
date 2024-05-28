import "package:chatapp/widgets/custom_appbar.dart";
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
    final double height = MediaQuery.of(context).size.height;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.52,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyCustomAppBar(
              height: height * 0.12,
              horizontalPadding: 22,
              leadingWidget: MyIconButtonLayout(
                buttonIcon: Icons.arrow_back,
                onClick: () => Navigator.pop(context),
                iconSize: 25,
                iconWeight: FontWeight.w700,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Simple and easy.",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Form(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    MyTextInputField(
                      prefixIcon: true,
                      imagePath: "assets/icons/user.png",
                      textHint: "Username",
                      keyboardType: TextInputType.name,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextInputField(
                      prefixIcon: true,
                      imagePath: "assets/icons/mail.png",
                      textHint: "Email",
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextInputField(
                      prefixIcon: true,
                      imagePath: "assets/icons/lock.png",
                      textHint: "Password",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    MyFormsButtonsLayout(
                      text: "Let's Chat",
                      bgColor: Colors.black,
                      fgColor: Colors.white,
                      width: 90,
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
            SizedBox(
              height: height * 0.25,
            ),
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
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
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
    );
  }
}
