import "package:flutter/material.dart";

class MyMessageSectionWidget extends StatelessWidget {
  const MyMessageSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      reverse: true,
      shrinkWrap: true,
      padding: const EdgeInsets.all(15),
      children: [
        MyMessageBubbleWidget(
          isMe: true,
          message: "Hey man, what are you doing?",
          sentTime: DateTime.now(),
        ),
        MyMessageBubbleWidget(
          isMe: false,
          message:
              "Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?",
          sentTime: DateTime.now(),
        ),
        MyMessageBubbleWidget(
          isMe: false,
          message:
              "Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?",
          sentTime: DateTime.now(),
        ),
        MyMessageBubbleWidget(
          isMe: false,
          message:
              "Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?",
          sentTime: DateTime.now(),
        ),
        MyMessageBubbleWidget(
          isMe: false,
          message:
              "Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?",
          sentTime: DateTime.now(),
        ),
        MyMessageBubbleWidget(
          isMe: false,
          message:
              "Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?Doing great, what about you?",
          sentTime: DateTime.now(),
        ),
      ],
    );
  }
}

class MyMessageBubbleWidget extends StatelessWidget {
  const MyMessageBubbleWidget({
    super.key,
    required this.isMe,
    required this.message,
    required this.sentTime,
  });

  final bool isMe;
  final String message;
  final DateTime sentTime;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.7;
    const double radius = 20;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: width),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: isMe
                ? const Color.fromARGB(255, 88, 152, 36)
                : const Color.fromARGB(255, 39, 139, 103),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(radius),
              topRight: const Radius.circular(radius),
              bottomLeft: isMe ? const Radius.circular(radius) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(radius),
            ),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            softWrap: true,
            maxLines: 20,
          ),
        ),
      ),
    );
  }
}
