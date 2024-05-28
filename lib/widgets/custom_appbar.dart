import "package:flutter/material.dart";

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    super.key,
    required this.height,
    this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.color = Colors.transparent,
    this.titleColor = Colors.black,
    this.titleStyle = FontStyle.normal,
    this.titleSize = 30,
    this.horizontalPadding = 10,
  });

  final double height;
  final String? title;
  final Color titleColor;
  final double titleSize;
  final FontStyle titleStyle;
  final Color color;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
      color: color,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingWidget != null) leadingWidget!,
          const SizedBox(
            width: 28,
          ),
          if (title != null)
            Expanded(
              flex: 10,
              child: Text(
                title!,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: titleColor,
                    fontSize: titleSize,
                    fontStyle: titleStyle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          if (trailingWidget != null) trailingWidget!,
          if (title == null && trailingWidget == null) const Spacer(),
        ],
      ),
    );
  }
}
