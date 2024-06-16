import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class MyChatBoxCard extends StatelessWidget {
  const MyChatBoxCard({
    super.key,
    this.cardImage = 'assets/images/Profile.png',
    this.cardName = 'John Doe',
    this.cardDescription =
        'Adjust the parameters and styles as needed to fit your design requirements.Adjust the parameters and styles as needed to fit',
  });

  final String cardImage;
  final String cardName;
  final String cardDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(cardImage),
            radius: 38,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      cardName,
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Text(
                      cardDescription,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
