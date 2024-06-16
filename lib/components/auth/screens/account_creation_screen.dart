import 'package:chatapp/components/auth/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/components/auth/screens/login_screen.dart';
import 'package:chatapp/components/splash_screen/screens/start_screen.dart';
import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/custom_appbar.dart';
import 'package:chatapp/utils/buttons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyAccountCreationScreen extends StatefulWidget {
  const MyAccountCreationScreen({super.key});

  @override
  State<MyAccountCreationScreen> createState() =>
      _MyAccountCreationScreenState();
}

class _MyAccountCreationScreenState extends State<MyAccountCreationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.28,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ListTile(
                            title: Text("Sign Up"),
                            subtitle: Text("Simple and easy."),
                            titleTextStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                            ),
                            subtitleTextStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
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
                            obscureText: false,
                            bgColor: Colors.grey.shade200,
                            validatorCallback: ValidationBuilder()
                                .minLength(4,
                                    'Username must be at least 4 characters long')
                                .maxLength(15,
                                    'Username must not exceed 15 characters')
                                .build(),
                          ),
                          const SizedBox(height: 15),
                          MyTextFormInputField(
                            controller: emailController,
                            prefixIcon: true,
                            imagePath: "assets/icons/mail.png",
                            textHint: "Email",
                            keyboardType: TextInputType.emailAddress,
                            bgColor: Colors.grey.shade200,
                            obscureText: false,
                            validatorCallback: ValidationBuilder()
                                .email('Enter a valid email address')
                                .build(),
                          ),
                          const SizedBox(height: 15),
                          MyTextFormInputField(
                            controller: passwordController,
                            prefixIcon: true,
                            imagePath: "assets/icons/lock.png",
                            textHint: "Password",
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            bgColor: Colors.grey.shade200,
                            validatorCallback: ValidationBuilder()
                                .required('Password is required')
                                .minLength(6,
                                    'Password must be at least 6 characters long')
                                .maxLength(20,
                                    'Password must not exceed 20 characters')
                                .build(),
                          ),
                          const SizedBox(height: 35),
                          MyTextButtonLayout(
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
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await authService.signUpUser(
                                      emailController.text.trim(),
                                      usernameController.text.trim(),
                                      passwordController.text.trim());
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Account created successfully'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }

                                  await Future.delayed(
                                      const Duration(seconds: 2));

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      child: const MyStartScreen(),
                                      type: PageTransitionType.fade,
                                      duration:
                                          const Duration(milliseconds: 500),
                                    ),
                                    (route) => false,
                                  );
                                } on AuthException catch (e) {
                                  String errorMessage;
                                  switch (e.message) {
                                    case 'User already exists':
                                      errorMessage =
                                          'A user with this email already exists';
                                      break;
                                    case 'Invalid email':
                                      errorMessage = 'Invalid email address';
                                      break;
                                    default:
                                      errorMessage =
                                          'Sign up failed: ${e.message}';
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(errorMessage),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                } catch (e) {
                                  print('Error: $e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('An unexpected error occurred'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a User? ",
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
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In Now.",
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
