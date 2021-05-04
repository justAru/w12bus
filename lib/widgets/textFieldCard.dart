import 'package:flutter/material.dart';

class TextFieldCard extends StatelessWidget {
  final String text;
  final Color color;
  const TextFieldCard({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 20,
        child: TextFormField(
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
          initialValue: text,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}
