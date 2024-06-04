import 'package:flutter/material.dart';

//  This funtion will be modified when I ll be using the API
class MyRecentAvatarsRowWidget extends StatelessWidget {
  const MyRecentAvatarsRowWidget({
    super.key,
    this.imagePath = 'assets/images/Profile.png',
    this.avatarName = 'John Doe',
  });

  final String imagePath;
  final String avatarName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, i) {
          return _avatarCreator(imagePath, avatarName);
        },
      ),
    );
  }

  Container _avatarCreator(String imagePath, String avatarName) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          Text(
            avatarName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
