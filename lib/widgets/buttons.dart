import 'package:flutter/material.dart';

class MyFormsButtonsLayout extends StatelessWidget {
  const MyFormsButtonsLayout({
    super.key,
    required this.bgColor,
    required this.fgColor,
    this.text,
    this.onTap,
    this.roundedBorderRadius = 0,
    this.boxShadow = false,
    this.height = 20,
    this.width = 30,
    this.suffixIcon,
  });

  final String? text;
  final Color bgColor;
  final Color fgColor;
  final double height;
  final double width;
  final double roundedBorderRadius;
  final bool boxShadow;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(roundedBorderRadius),
          boxShadow: boxShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.65),
                    offset: const Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: fgColor,
                ),
              ),
            if (suffixIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: suffixIcon,
              ),
          ],
        ),
      ),
    );
  }
}

class MyIconButtonLayout extends StatelessWidget {
  const MyIconButtonLayout({
    super.key,
    required this.buttonIcon,
    this.onClick,
    this.iconColor = Colors.white,
    this.iconWeight = FontWeight.w500,
    this.iconSize = 20,
  });
  final IconData buttonIcon;
  final FontWeight iconWeight;
  final Color iconColor;
  final VoidCallback? onClick;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        String.fromCharCode(buttonIcon.codePoint),
        style: TextStyle(
          color: iconColor,
          fontSize: iconSize,
          fontWeight: iconWeight,
          fontFamily: buttonIcon.fontFamily,
        ),
      ),
    );
  }
}
