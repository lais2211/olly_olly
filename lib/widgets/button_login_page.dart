import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLoginPage extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonLoginPage({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(17),
      color: Colors.greenAccent,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
    );
  }
}