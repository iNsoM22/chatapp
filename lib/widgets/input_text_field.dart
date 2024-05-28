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
  });
  final TextInputType keyboardType;
  final String textHint;
  final bool obscureText;
  final bool? prefixIcon;
  final Function(String)? onChangedFunction;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      textAlign: TextAlign.left,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        hintText: textHint,
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon == true && imagePath != null
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onChanged: onChangedFunction,
    );
  }
}
