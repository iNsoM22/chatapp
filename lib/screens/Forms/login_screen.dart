import "package:chatapp/screens/Dashboard/homepage_screen.dart";
import "package:chatapp/screens/Forms/account_creation_screen.dart";
import "package:chatapp/widgets/background_interface.dart";
import "package:chatapp/widgets/custom_appbar.dart";
import "package:flutter/material.dart";
import "package:page_transition/page_transition.dart";
import "../../widgets/buttons.dart";
import "../../widgets/input_text_field.dart";

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.3,
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
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ListTile(
                        title: Text("Login"),
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
                      const SizedBox(
                        height: 35,
                      ),
                      MyTextInputField(
                        prefixIcon: true,
                        imagePath: "assets/icons/user.png",
                        textHint: "Username",
                        keyboardType: TextInputType.name,
                        bgColor: Colors.grey.shade200,
                        obscureText: false,
                        padH: 0,
                        padV: 0,
                      ),
                      const SizedBox(
                        height: 18,
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
                        text: "Sign in",
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
                            child: const MyChatHomePage(),
                            type: PageTransitionType.fade,
                          ),
                          (route) => false,
                        ),
                      ),
                      SizedBox(height: height * 0.33),
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
                                  child: const MyAccountCreationScreen(),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
