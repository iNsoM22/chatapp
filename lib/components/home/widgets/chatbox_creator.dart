import "package:chatapp/components/home/widgets/chatbox_cards.dart";
import "package:flutter/material.dart";

// This function will be modified when Handling APIs

class MyChatBoxCardsSectionCreator extends StatelessWidget {
  const MyChatBoxCardsSectionCreator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: true,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/chatbox:id');
          },
          child: const MyChatBoxCard(),
        ),
      ),
    );
  }
}
