import 'package:chatapp/widgets/background_interface.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/chatbox_creator.dart';
import 'package:chatapp/widgets/recent_avators.dart';

class MyChatHomePage extends StatefulWidget {
  const MyChatHomePage({super.key});

  @override
  State<MyChatHomePage> createState() => _MyChatHomePageState();
}

class _MyChatHomePageState extends State<MyChatHomePage> {
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  void _closeSidebar() {
    setState(() {
      _isSidebarOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: MyIconButtonLayout(
            buttonIcon: Icons.menu,
            iconColor: Colors.white,
            iconSize: 30,
            iconWeight: FontWeight.w600,
            onClick: _toggleSidebar,
          ),
        ),
        titleSpacing: 25,
        actions: const [
          MyIconButtonLayout(
            buttonIcon: Icons.search_sharp,
            iconColor: Colors.white,
            iconSize: 30,
            iconWeight: FontWeight.w600,
          ),
        ],
      ),
      body: MyCustomBackgroundStackWidget(
        backgroundDarken: 0.5,
        child: Column(
          children: [
            const Divider(
              color: Colors.white,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: height * 0.17,
              child: const MyRecentAvatarsRowWidget(),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 4, left: 20, right: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 46, 51),
                  backgroundBlendMode: BlendMode.plus,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: const MyChatBoxCardsSectionCreator(),
              ),
            ),
          ],
        ),
        // if (_isSidebarOpen)
        //   Positioned(
        //     top: 0,
        //     bottom: 0,
        //     left: 0,
        //     width: width * 0.6,
        //     child: GestureDetector(
        //       onHorizontalDragEnd: (details) {
        //         double velocity = details.primaryVelocity ?? 0;
        //         double velocityThreshold = 300;

        //         if (velocity.abs() > velocityThreshold) {
        //           _closeSidebar();
        //         }
        //       },
        //       child: MyCustomSideBarWidget(onClose: _closeSidebar),
        //     ),
        //   ),
        // if (_isSidebarOpen)
        //   Positioned(
        //     top: 0,
        //     bottom: 0,
        //     left: width * 0.6,
        //     right: 0,
        //     child: GestureDetector(
        //       onTap: _closeSidebar,
        //       child: Container(
        //         color: Colors.transparent,
        //       ),
        //     ),
        //   ),
      ),
    );
  }
}
