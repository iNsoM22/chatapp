import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatapp/components/auth/screens/account_creation_screen.dart';
import 'package:chatapp/components/auth/widgets/input_text_field.dart';
import 'package:chatapp/components/home/screens/homepage_screen.dart';
import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/buttons.dart';
import 'package:chatapp/utils/custom_appbar.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.2,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 18, right: 20, bottom: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: IntrinsicHeight(
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
                  Expanded(
                    flex: 5,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ListTile(
                            title: Text("Login"),
                            subtitle: Text("Simple and easy."),
                            titleTextStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                            ),
                            subtitleTextStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 35),
                          MyTextFormInputField(
                            controller: usernameController,
                            prefixIcon: true,
                            imagePath: "assets/icons/user.png",
                            textHint: "Username",
                            keyboardType: TextInputType.name,
                            bgColor: Colors.grey.shade200,
                            obscureText: false,
                            validatorCallback:
                                ValidationBuilder().email().build(),
                          ),
                          const SizedBox(height: 18),
                          MyTextFormInputField(
                            controller: passwordController,
                            prefixIcon: true,
                            imagePath: "assets/icons/lock.png",
                            textHint: "Password",
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            bgColor: Colors.grey.shade200,
                            validatorCallback: ValidationBuilder()
                                .required()
                                .minLength(6)
                                .maxLength(20)
                                .build(),
                          ),
                          const SizedBox(height: 35),
                          MyTextButtonLayout(
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
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    child: const MyChatHomePage(),
                                    type: PageTransitionType.fade,
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
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
                                duration: const Duration(milliseconds: 500),
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
