import 'package:flutter/material.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/chatbox_creator.dart';
import 'package:chatapp/widgets/custom_appbar.dart';
import 'package:chatapp/widgets/recent_avators.dart';
import 'package:chatapp/widgets/sidebar_widget.dart';
import '../../widgets/background_scaffold.dart';

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

    return MyCustomBackgroudScaffold(
      backgroundDarken: 0.74,
      child: Stack(
        children: [
          AbsorbPointer(
            absorbing: _isSidebarOpen,
            child: Column(
              children: [
                MyCustomAppBar(
                  height: height * 0.11,
                  title: "Messages",
                  titleSize: 30,
                  titleColor: Colors.white,
                  leadingWidget: MyIconButtonLayout(
                    buttonIcon: Icons.menu,
                    iconColor: Colors.white,
                    iconSize: 30,
                    iconWeight: FontWeight.w600,
                    onClick: _toggleSidebar,
                  ),
                  trailingWidget: const MyIconButtonLayout(
                    buttonIcon: Icons.search_sharp,
                    iconColor: Colors.white,
                    iconSize: 30,
                    iconWeight: FontWeight.w600,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 7),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
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
          ),
          if (_isSidebarOpen)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              width: width * 0.6,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  double velocity = details.primaryVelocity ?? 0;
                  double velocityThreshold = 300;

                  if (velocity.abs() > velocityThreshold) {
                    _closeSidebar();
                  }
                },
                child: MyCustomSideBarWidget(onClose: _closeSidebar),
              ),
            ),
          if (_isSidebarOpen)
            Positioned(
              top: 0,
              bottom: 0,
              left: width * 0.6,
              right: 0,
              child: GestureDetector(
                onTap: _closeSidebar,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
