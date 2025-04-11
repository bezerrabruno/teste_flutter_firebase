import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool icon;
  final bool obscure;

  final FocusNode focusNode;
  final TextEditingController controller;

  final Function()? onPressed;

  const AppTextField({
    super.key,
    required this.hint,
    this.icon = false,
    this.obscure = false,
    required this.focusNode,
    required this.controller,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.5,
          color: Colors.white,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          cursorColor: Colors.white,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscure,
          style: TextStyle(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            contentPadding: const EdgeInsets.all(8),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: icon
                ? Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: IconButton(
                      key: const Key('suffixIcon'),
                      icon: Icon(
                        obscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                      ),
                      color: Colors.white,
                      onPressed: onPressed,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
