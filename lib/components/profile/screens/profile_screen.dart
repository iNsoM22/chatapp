import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/buttons.dart';
import 'package:chatapp/utils/custom_appbar.dart';
import 'package:chatapp/components/auth/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class MyAccountProfileScreen extends StatefulWidget {
  const MyAccountProfileScreen({super.key});

  @override
  State<MyAccountProfileScreen> createState() => _MyAccountProfileScreenState();
}

class _MyAccountProfileScreenState extends State<MyAccountProfileScreen> {
  bool _isEditing = false;

  final TextEditingController _usernameController =
      TextEditingController(text: 'CurrentUsername');
  final TextEditingController _emailController =
      TextEditingController(text: 'current.email@example.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '********');

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.2,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              MyCustomAppBar(
                height: height * 0.09,
                horizontalPadding: 30,
                leadingWidget: MyIconButtonLayout(
                  buttonIcon: Icons.arrow_back,
                  iconColor: Colors.white,
                  onClick: () {
                    Navigator.pop(context);
                  },
                  iconSize: 31,
                  iconWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * 0.3,
                height: height * 0.2,
                child: ClipRect(
                  child: Image.asset('assets/images/Profile.png'),
                ),
              ),
              const Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: height * 0.02),
              MyTextButtonLayout(
                onTap: () => _toggleEdit(),
                bgColor: const Color.fromARGB(255, 133, 161, 73),
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 25,
                ),
                fgColor: const Color.fromARGB(255, 0, 0, 0),
                text: _isEditing ? 'Save' : 'Edit Profile',
                height: 10,
                width: 30,
                roundedBorderRadius: 30,
              ),
              SizedBox(height: height * 0.03),
              // _buildTextInputField(
              //   controller: _usernameController,
              //   hint: 'Username',
              //   iconPath: 'assets/icons/user.png',
              //   isEnabled: _isEditing,
              // ),
              // _buildTextInputField(
              //   controller: _emailController,
              //   hint: 'Email',
              //   iconPath: 'assets/icons/mail.png',
              //   isEnabled: _isEditing,
              // ),
              // _buildTextInputField(
              //   controller: _passwordController,
              //   hint: 'Password',
              //   iconPath: 'assets/icons/lock.png',
              //   isEnabled: _isEditing,
              //   obscureText: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }

//   MyTextInputField _buildTextInputField({
//     required TextEditingController controller,
//     required String hint,
//     required String iconPath,
//     bool isEnabled = true,
//     bool obscureText = false,
//   }) {
//     return MyTextInputField(
//       isEnabled: isEnabled,
//       bgColor: const Color.fromARGB(213, 223, 237, 186),
//       textHint: hint,
//       keyboardType: TextInputType.text,
//       obscureText: obscureText,
//       prefixIcon: true,
//       imagePath: iconPath,
//       validatorCallback: (val) {},
//     );
//   }
}
