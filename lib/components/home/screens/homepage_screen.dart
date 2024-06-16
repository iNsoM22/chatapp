import 'package:chatapp/components/home/widgets/search_bar_widget.dart';
import 'package:chatapp/components/home/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/utils/background_interface.dart';
import 'package:chatapp/utils/buttons.dart';
import 'package:chatapp/components/home/widgets/chatbox_creator.dart';

class MyChatHomePage extends StatefulWidget {
  const MyChatHomePage({super.key});

  @override
  State<MyChatHomePage> createState() => _MyChatHomePageState();
}

class _MyChatHomePageState extends State<MyChatHomePage> {
  bool _isSearching = false;
  double _bgDarken = 0.5;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      _bgDarken = _isSearching ? 0.89 : 0.45;
    });
  }

  void _handleSearch(String query) {
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        titleSpacing: 25,
        actions: [
          MyIconButtonLayout(
            buttonIcon: Icons.search_sharp,
            iconColor: Colors.white,
            iconSize: 30,
            iconWeight: FontWeight.w600,
            onClick: _toggleSearch,
          ),
        ],
      ),
      drawer: const MyCustomSideBarWidget(),
      body: Stack(
        children: [
          MyCustomBackgroundStackWidget(
            backgroundDarken: _bgDarken,
            child: Column(
              children: [
                const Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 4, left: 20, right: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 9, 53, 60),
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
          if (_isSearching)
            GestureDetector(
              onTap: _toggleSearch,
              child: Container(
                color: Colors.black54,
              ),
            ),
          if (_isSearching)
            Positioned(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
                  child: MySearchBarWidget(
                    onChanged: _handleSearch,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
