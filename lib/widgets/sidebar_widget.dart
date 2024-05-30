import 'package:flutter/material.dart';

class MyCustomSideBarWidget extends StatefulWidget {
  const MyCustomSideBarWidget({
    super.key,
    this.userName = "Username",
    this.userImage = 'assets/images/Profile.png',
    required this.onClose,
  });

  final String userName;
  final String userImage;
  final VoidCallback onClose;

  @override
  State<MyCustomSideBarWidget> createState() => _MyCustomSideBarWidgetState();
}

class _MyCustomSideBarWidgetState extends State<MyCustomSideBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                widget.onClose(); // Call the callback to close the sidebar
                Navigator.pushNamed(context, '/profile');
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
                widget.onClose(); // Call the callback to close the sidebar
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
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
