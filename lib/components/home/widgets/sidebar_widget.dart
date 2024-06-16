import 'package:chatapp/components/profile/screens/profile_screen.dart';
import 'package:chatapp/components/splash_screen/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyCustomSideBarWidget extends StatefulWidget {
  const MyCustomSideBarWidget({
    super.key,
    this.userName = "Username",
    this.userImage = 'assets/images/Profile.png',
  });

  final String userName;
  final String userImage;

  @override
  State<MyCustomSideBarWidget> createState() => _MyCustomSideBarWidgetState();
}

class _MyCustomSideBarWidgetState extends State<MyCustomSideBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/bg2.jpg').image,
                fit: BoxFit.cover,
              ),
              color: Colors.lightGreen.shade400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.userImage),
                  radius: 45,
                ),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageTransition(
                      child: MyAccountProfileScreen(),
                      type: PageTransitionType.fade),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const MyStartScreen(),
                    type: PageTransitionType.fade,
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
