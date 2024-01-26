import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldLoginPage extends StatefulWidget {
  final String text;
  final bool private;
  final TextEditingController controller; 

  TextFieldLoginPage({
    required this.text,
    required this.private,
    required this.controller, 
  });

  @override
  State<TextFieldLoginPage> createState() => _TextFieldLoginPageState();
}

class _TextFieldLoginPageState extends State<TextFieldLoginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: widget.controller, 
      cursorColor: Colors.pinkAccent,
      padding: EdgeInsets.all(15),
      placeholder: widget.text,
      obscureText: widget.private,
      placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
      style: TextStyle(color: Colors.white, fontSize: 14),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
    );
  }
}