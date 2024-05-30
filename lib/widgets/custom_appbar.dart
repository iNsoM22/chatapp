import 'package:flutter/material.dart';

class MyCustomAppBar extends StatefulWidget {
  const MyCustomAppBar({
    Key? key,
    required this.height,
    this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.color = Colors.transparent,
    this.titleColor = Colors.black,
    this.titleStyle = FontStyle.normal,
    this.titleSize = 30,
    this.horizontalPadding = 10,
    this.blendMode = BlendMode.darken,
  }) : super(key: key);

  final double height;
  final String? title;
  final Color titleColor;
  final double titleSize;
  final FontStyle titleStyle;
  final Color color;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final double horizontalPadding;
  final BlendMode blendMode;

  @override
  _MyCustomAppBarState createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding, vertical: 0),
      decoration: BoxDecoration(
        backgroundBlendMode: widget.blendMode,
        color: widget.color,
      ),
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.leadingWidget != null) widget.leadingWidget!,
          const SizedBox(
            width: 28,
          ),
          if (widget.title != null)
            Expanded(
              flex: 10,
              child: Text(
                widget.title!,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: widget.titleColor,
                    fontSize: widget.titleSize,
                    fontStyle: widget.titleStyle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          if (widget.trailingWidget != null) widget.trailingWidget!,
          if (widget.title == null && widget.trailingWidget == null)
            const Spacer(),
        ],
      ),
    );
  }
}
