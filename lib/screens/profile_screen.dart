import "package:chatapp/widgets/background_scaffold.dart";
import "package:chatapp/widgets/buttons.dart";
import "package:chatapp/widgets/custom_appbar.dart";
import "package:flutter/material.dart";

class MyAccountProfileScreen extends StatefulWidget {
  const MyAccountProfileScreen({super.key});

  @override
  State<MyAccountProfileScreen> createState() => _MyAccountProfileScreenState();
}

class _MyAccountProfileScreenState extends State<MyAccountProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MyCustomAppBar(
              height: height * 0.12,
              horizontalPadding: 30,
              color: Colors.black,
              titleColor: Colors.white,
              title: 'Profile',
              titleSize: 25,
              leadingWidget: MyIconButtonLayout(
                buttonIcon: Icons.arrow_left,
                iconColor: Colors.white,
                onClick: () {
                  Navigator.pop(context);
                },
                iconSize: 21,
                iconWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
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
                  fontWeight: FontWeight.w800),
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
            SizedBox(
              height: height * 0.02,
            ),
            const MyFormsButtonsLayout(
              bgColor: Color.fromARGB(255, 133, 161, 73),
              suffixIcon: Icon(
                Icons.edit,
                color: Colors.black,
                size: 25,
              ),
              fgColor: Color.fromARGB(255, 0, 0, 0),
              text: 'Edit Profile',
              height: 10,
              width: 30,
              roundedBorderRadius: 30,
            )
          ],
        ),
      ),
    );
  }
}
