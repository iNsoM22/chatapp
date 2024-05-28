import "package:flutter/material.dart";

class MyTextInputField extends StatelessWidget {
  const MyTextInputField({
    super.key,
    required this.textHint,
    required this.keyboardType,
    required this.obscureText,
    required this.prefixIcon,
    this.onChangedFunction,
    this.imagePath,
    this.trailingButton,
    this.onTap,
    this.inputFieldHeight = 55,
  });

  final TextInputType keyboardType;
  final String textHint;
  final bool obscureText;
  final bool? prefixIcon;
  final Function(String)? onChangedFunction;
  final String? imagePath;
  final Widget? trailingButton;
  final VoidCallback? onTap;
  final double inputFieldHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: inputFieldHeight,
            child: TextFormField(
              keyboardType: keyboardType,
              obscureText: obscureText,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                hintText: textHint,
                fillColor: Colors.grey.shade200,
                prefixIcon: imagePath != null
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
              ),
              onChanged: onChangedFunction,
            ),
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
    );
  }
}
