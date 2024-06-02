import 'package:flutter/material.dart';

class MyTextInputField extends StatelessWidget {
  const MyTextInputField({
    super.key,
    required this.textHint,
    required this.keyboardType,
    required this.obscureText,
    this.prefixIcon = false,
    this.onChangedFunction,
    this.imagePath,
    this.trailingButton,
    this.onTap,
    this.isEnabled = true,
    this.padH = 20.0,
    this.padV = 60.0,
    this.bgColor = Colors.grey,
  });

  final TextInputType keyboardType;
  final String textHint;
  final bool obscureText;
  final bool prefixIcon;
  final Function(String)? onChangedFunction;
  final String? imagePath;
  final Widget? trailingButton;
  final VoidCallback? onTap;
  final double padH;
  final double padV;
  final bool isEnabled;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padV, horizontal: padH),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enabled: isEnabled,
              keyboardType: keyboardType,
              obscureText: obscureText,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                hintText: textHint,
                fillColor: bgColor,
                prefixIcon: prefixIcon && imagePath != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          imagePath!,
                          repeat: ImageRepeat.noRepeat,
                          height: 10,
                          width: 10,
                        ),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onChanged: onChangedFunction,
            ),
          ),
          if (trailingButton != null)
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 5),
              child: GestureDetector(
                onTap: onTap,
                child: trailingButton!,
              ),
            ),
        ],
      ),
    );
  }
}
